#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
高级Lua代码混淆器
支持多种混淆技术，让Lua代码变得极其难以理解和逆向
"""

import random
import string
import base64
import zlib
import marshal
import pickle
import hashlib
import re
import math
import itertools
from collections import defaultdict
import keyword

class LuaObfuscator:
    def __init__(self):
        self.string_pool = []
        self.function_names = []
        self.variable_map = {}
        self.used_names = set()
        self.encryption_keys = []
        self.control_flow_obfuscation = True
        self.string_encryption = True
        self.variable_renaming = True
        

    
    def _generate_random_name(self, length=8):
        """生成随机变量名"""
        while True:
            # 使用混合字符集：字母、数字、下划线，但以字母开头
            first_char = random.choice(string.ascii_letters)
            other_chars = ''.join(random.choices(string.ascii_letters + string.digits + '_', k=length-1))
            name = first_char + other_chars
            
            # 确保不是Lua关键字且未使用过
            if name not in keyword.kwlist and name not in self.used_names:
                self.used_names.add(name)
                return name
    

    
    def _encrypt_string(self, text):
        """加密字符串"""
        # 使用XOR加密
        key = random.randint(1, 255)
        self.encryption_keys.append(key)
        
        encrypted = ''.join(chr(ord(c) ^ key) for c in text)
        # 转换为十六进制字符串
        hex_encrypted = ''.join(f'{ord(c):02x}' for c in encrypted)
        
        return f'loadstring("\\' + hex_encrypted + '"):gsub(".", function(c) return string.char(tonumber(c, 16) ^ {key}) end)'
    
    def _obfuscate_strings(self, code):
        """混淆字符串"""
        if not self.string_encryption:
            return code
        
        # 匹配字符串字面量
        string_pattern = r'"([^"\\]*(\\.[^"\\]*)*)"'
        
        def replace_string(match):
            text = match.group(1)
            # 跳过太短的字符串
            if len(text) < 3:
                return match.group(0)
            
            # 随机决定是否加密
            if random.random() < 0.7:  # 70%概率加密
                return self._encrypt_string(text)
            return match.group(0)
        
        return re.sub(string_pattern, replace_string, code)
    
    def _rename_variables(self, code):
        """重命名变量"""
        if not self.variable_renaming:
            return code
        
        # 匹配变量名
        # 这个正则表达式匹配Lua标识符
        var_pattern = r'\b([a-zA-Z_][a-zA-Z0-9_]*)\b'
        
        # 跳过的关键字
        skip_keywords = {
            'local', 'function', 'end', 'if', 'then', 'else', 'elseif', 'while', 'do', 'repeat', 'until',
            'for', 'in', 'break', 'return', 'and', 'or', 'not', 'true', 'false', 'nil',
            'gui', 'Reference', 'SetName', 'SetOptions', 'for', 'in', 'do', 'end', 'if', 'then'
        }
        
        def replace_var(match):
            var_name = match.group(1)
            
            # 跳过关键字和已知的API
            if var_name in skip_keywords or var_name.startswith('RF'):
                return var_name
            
            # 为变量生成新名字
            if var_name not in self.variable_map:
                self.variable_map[var_name] = self._generate_random_name()
            
            return self.variable_map[var_name]
        
        return re.sub(var_pattern, replace_var, code)
    
    def _add_control_flow_obfuscation(self, code):
        """添加控制流混淆"""
        if not self.control_flow_obfuscation:
            return code
        
        lines = code.split('\n')
        result_lines = []
        
        i = 0
        while i < len(lines):
            line = lines[i]
            
            # 在某些代码块前添加条件判断
            if random.random() < 0.2 and line.strip():
                # 生成随机条件
                condition_var = self._generate_random_name()
                condition_value = random.choice(['true', 'false'])
                
                result_lines.append(f'local {condition_var} = {condition_value}')
                result_lines.append(f'if {condition_var} then')
                result_lines.append(line)
                
                # 查找对应的end
                j = i + 1
                indent_level = 0
                while j < len(lines):
                    if lines[j].strip().endswith('end'):
                        if indent_level == 0:
                            result_lines.append(lines[j])
                            result_lines.append('end')  # 关闭if
                            i = j
                            break
                        else:
                            indent_level -= 1
                    elif any(lines[j].strip().startswith(kw) for kw in ['if', 'for', 'while', 'function', 'do']):
                        indent_level += 1
                    result_lines.append(lines[j])
                    j += 1
                else:
                    result_lines.append('end')  # 如果没找到end，自己添加
            else:
                result_lines.append(line)
            
            i += 1
        
        return '\n'.join(result_lines)
    
    def _add_anti_debug_code(self, code):
        """添加反调试代码"""
        anti_debug_code = '''
-- 反调试代码
local _debug_check = function()
    local _info = debug.getinfo(2, "S")
    if _info and _info.source and _info.source ~= "=[C]" then
        return false
    end
    return true
end

if not _debug_check() then
    error("Script integrity check failed")
end

-- 检测调试器
local _anti_debug = {
    _check = function()
        local _status, _err = pcall(function()
            debug.sethook(function() error("debug detected") end, "c")
        end)
        return _status
    end
}

if not _anti_debug._check() then
    while true do end
end
'''
        return anti_debug_code + '\n' + code
    
    def _add_integrity_check(self, code):
        """添加完整性检查"""
        # 计算代码的哈希值
        code_hash = hashlib.md5(code.encode()).hexdigest()
        
        integrity_code = f'''
-- 完整性检查
local _script_hash = "{code_hash}"
local _current_hash = function()
    local _content = [==[{code}]==]
    return require("crypto").md5(_content)
end

if _current_hash() ~= _script_hash then
    error("Script tampered with")
end
'''
        
        return integrity_code + '\n' + code
    
    def _pack_code(self, code):
        """打包代码"""
        # 使用多种编码方式
        methods = ['base64', 'zlib', 'custom']
        method = random.choice(methods)
        
        if method == 'base64':
            encoded = base64.b64encode(code.encode()).decode()
            return f'loadstring(require("base64").decode("{encoded}"))()'
        elif method == 'zlib':
            compressed = zlib.compress(code.encode())
            encoded = base64.b64encode(compressed).decode()
            return f'loadstring(zlib.decompress(require("base64").decode("{encoded}")))()'
        else:
            # 自定义编码
            encoded = ''.join(f'{ord(c):03d}' for c in code)
            return f'loadstring(string.char(table.unpack({list(map(int, [encoded[i:i+3] for i in range(0, len(encoded), 3)]))})))()'
    
    def obfuscate(self, code, level='medium'):
        """主混淆函数"""
        print(f"开始混淆代码，级别: {level}")
        
        # 根据级别设置混淆选项
        if level == 'light':
            self.control_flow_obfuscation = False
            self.string_encryption = True
            self.variable_renaming = True
        elif level == 'medium':
            self.control_flow_obfuscation = True
            self.string_encryption = True
            self.variable_renaming = True
        elif level == 'heavy':
            self.control_flow_obfuscation = True
            self.string_encryption = True
            self.variable_renaming = True
        
        # 步骤1：添加反调试代码
        code = self._add_anti_debug_code(code)
        print("✓ 添加反调试代码")
        
        # 步骤2：变量重命名
        if self.variable_renaming:
            code = self._rename_variables(code)
            print("✓ 变量重命名")
        
        # 步骤3：字符串加密
        if self.string_encryption:
            code = self._obfuscate_strings(code)
            print("✓ 字符串加密")
        
        # 步骤4：控制流混淆
        if self.control_flow_obfuscation:
            code = self._add_control_flow_obfuscation(code)
            print("✓ 控制流混淆")
        
        # 步骤5：添加完整性检查
        code = self._add_integrity_check(code)
        print("✓ 添加完整性检查")
        
        # 步骤6：最终打包（可选）
        if level == 'heavy':
            try:
                code = self._pack_code(code)
                print("✓ 代码打包")
            except:
                print("⚠ 打包失败，使用原始代码")
        
        print("混淆完成！")
        return code

def main():
    # 读取Lua文件
    input_file = "e:/Project/AimWare_CS2_V6_CFG/Lua/汉化/汉化.lua"
    output_file = "e:/Project/AimWare_CS2_V6_CFG/Lua/汉化/汉化_已混淆.lua"
    
    try:
        with open(input_file, 'r', encoding='utf-8') as f:
            original_code = f.read()
        
        print(f"读取文件: {input_file}")
        print(f"原始代码长度: {len(original_code)} 字符")
        
        # 创建混淆器
        obfuscator = LuaObfuscator()
        
        # 选择混淆级别
        print("\n选择混淆级别:")
        print("1. light (轻度)")
        print("2. medium (中度)")
        print("3. heavy (重度)")
        
        choice = input("请选择 (1-3，默认为2): ").strip()
        
        level_map = {'1': 'light', '2': 'medium', '3': 'heavy'}
        level = level_map.get(choice, 'medium')
        
        # 执行混淆
        obfuscated_code = obfuscator.obfuscate(original_code, level)
        
        # 保存混淆后的代码
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write(obfuscated_code)
        
        print(f"\n混淆完成！")
        print(f"输出文件: {output_file}")
        print(f"混淆后代码长度: {len(obfuscated_code)} 字符")
        print(f"代码膨胀率: {((len(obfuscated_code) / len(original_code) - 1) * 100):.1f}%")
        
        # 显示混淆统计
        print(f"\n混淆统计:")
        print(f"- 加密字符串数量: {len(obfuscator.encryption_keys)}")
        print(f"- 重命名变量数量: {len(obfuscator.variable_map)}")
        print(f"- 使用的随机名称数量: {len(obfuscator.used_names)}")
        
    except FileNotFoundError:
        print(f"错误: 找不到文件 {input_file}")
    except Exception as e:
        print(f"混淆过程中出错: {e}")

if __name__ == "__main__":
    main()