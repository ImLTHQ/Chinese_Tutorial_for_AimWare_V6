local WeaponList={"Shared","Zeus","Pistol","Heavy Pistol","Submachine Gun","Rifle","Shotgun","Scout","Auto Sniper","Sniper","Light Machine Gun"}

local RF=gui.Reference

local function NM(RFName,SetName)  RFName:SetName(SetName)  end

NM(RF("Configurations"),"参数")
    NM(RF("参数", "Local"),"本地")

NM(RF("Lua Scripts"),"Lua脚本")
    NM(RF("Lua脚本", "Local"),"本地")
    NM(RF("Lua脚本", "Security"),"安全")
        NM(RF("Lua脚本", "安全", "Allow scripts to edit lua files"),"允许脚本编辑lua文件")
        NM(RF("Lua脚本", "安全", "Allow scripts to edit cfg files"),"允许脚本编辑cfg文件")
        NM(RF("Lua脚本", "安全", "Allow internet connections"),"允许网络连接")
        NM(RF("Lua脚本", "安全", "Allow game scripting"),"允许游戏脚本")
        NM(RF("Lua脚本", "安全", "Allow insecure FFI"),"允许不安全的FFI")
        NM(RF("Lua脚本", "安全", "Save Lua Permissions"),"保存Lua权限")
    NM(RF("Lua脚本", "Other"),"其它")
        NM(RF("Lua脚本", "其它", "Load With Configurations"),"随参数一同加载")

NM(RF("Legitbot"),"合法")
    NM(RF("合法", "Aimbot"),"自瞄")
        NM(RF("合法", "自瞄", "Main"),"主要")
            NM(RF("合法", "自瞄", "主要", "Enable"),"启用")
            NM(RF("合法", "自瞄", "主要", "Aim Key"),"热键")
            NM(RF("合法", "自瞄", "主要", "Auto Pistol Interval"),"自动手枪间隔")
        NM(RF("合法", "自瞄", "Hitbox Selection"),"自瞄部位选择")
            for i = 1, 11, 1 do
                NM(RF("合法", "自瞄", "自瞄部位选择", WeaponList[i], "Hitbox Advance Multiplier"),"自瞄部位切换速度")
                NM(RF("合法", "自瞄", "自瞄部位选择", WeaponList[i], "Nearest To Crosshair"),"准星附近优先")
            end
    NM(RF("合法", "Triggerbot"),"扳机")
        NM(RF("合法", "扳机", "Main"),"主要")
            NM(RF("合法", "扳机", "主要", "Enable"),"启用")
            NM(RF("合法", "扳机", "主要", "Trigger Key"),"热键")
            NM(RF("合法", "扳机", "主要", "Auto Fire"),"自动开火")
            NM(RF("合法", "扳机", "主要", "Knife Triggerbot"),"刀扳机")
        NM(RF("合法", "扳机", "Weapon"),"武器")
            for i = 1, 11, 1 do
                NM(RF("合法", "扳机", "武器", WeaponList[i], "Trigger Delay"),"扳机延迟")
                NM(RF("合法", "扳机", "武器", WeaponList[i], "Trigger Burst"),"扳机连发")
                NM(RF("合法", "扳机", "武器", WeaponList[i], "Hit Chance"),"命中率")
                NM(RF("合法", "扳机", "武器", WeaponList[i], "Accuracy"),"精度提升")
                NM(RF("合法", "扳机", "武器", WeaponList[i], "精度提升", "Anti-Recoil"),"反后座")
                NM(RF("合法", "扳机", "武器", WeaponList[i], "精度提升", "Anti-Spread"),"反扩散")
            end
        NM(RF("合法", "扳机", "Hitboxes"),"部位")
    NM(RF("合法", "Weapon"),"武器")
        NM(RF("合法", "武器", "Accuracy"),"压枪")
            for i = 1, 11, 1 do
                NM(RF("合法", "武器","压枪", WeaponList[i], "Recoil Control System"),"压枪模式")
                    RF("合法", "武器","压枪", WeaponList[i], "压枪模式"):SetOptions("关闭","自瞄时","独立")
                NM(RF("合法", "武器","压枪", WeaponList[i], "Horizontal Recoil"),"横向压枪")
                NM(RF("合法", "武器","压枪", WeaponList[i], "Vertical Recoil"),"纵向压枪")
            end
        NM(RF("合法", "武器", "Target"),"目标")
            for i = 1, 11, 1 do
                NM(RF("合法", "武器", "目标", WeaponList[i], "Minimum FOV Range"),"最小范围")
                NM(RF("合法", "武器", "目标", WeaponList[i], "Maximum FOV Range"),"最大范围")
                NM(RF("合法", "武器", "目标", WeaponList[i], "Non-Sticky Target"),"超过范围不自瞄")
                NM(RF("合法", "武器", "目标", WeaponList[i], "Target Switch Delay"),"目标切换延迟")
                NM(RF("合法", "武器", "目标", WeaponList[i], "First Shot Delay"),"首次射击延迟")
            end
        NM(RF("合法", "武器", "Aiming"),"瞄准")
            for i = 1, 11, 1 do
                NM(RF("合法", "武器", "瞄准", WeaponList[i], "Smooth Factor"),"平滑因子")
                NM(RF("合法", "武器", "瞄准", WeaponList[i], "Smooth Method"),"平滑方式")
                    RF("合法", "武器", "瞄准", WeaponList[i], "平滑方式"):SetOptions("动态", "静态")
                NM(RF("合法", "武器", "瞄准", WeaponList[i], "Randomize Factor"),"随机因子")
                NM(RF("合法", "武器", "瞄准", WeaponList[i], "Curve Factor"),"曲线因子")
            end
        NM(RF("合法", "武器", "Visibility"),"可见性")
            for i = 1, 11, 1 do
                NM(RF("合法", "武器", "可见性", WeaponList[i], "Auto Wall"),"穿墙")
                NM(RF("合法", "武器", "可见性", WeaponList[i], "Through Smoke"),"穿烟")
            end

NM(RF("Ragebot"),"暴力")
    NM(RF("暴力", "Main"),"主要")
        NM(RF("暴力", "主要", "Enabled"),"启用")
        NM(RF("暴力", "主要", "Silent Aim"),"静默")
        NM(RF("暴力", "主要", "Backtrack"),"回溯")
        NM(RF("暴力", "主要", "Anti-Recoil"),"无后座")
        NM(RF("暴力", "主要", "Anti-Spread"),"无扩散")
        NM(RF("暴力", "主要", "Target Selection"),"目标选择")
            RF("暴力", "主要", "目标选择"):SetOptions("最低血量", "距离最近", "准星最近");
        NM(RF("暴力", "主要", "FOV"),"范围")
        NM(RF("暴力", "主要", "Knifebot"),"自动刀")
            RF("暴力", "主要", "自动刀"):SetOptions("关闭","默认","仅背刺","快速刀");
        NM(RF("暴力", "主要", "Duck Peek assist"),"假蹲")
    NM(RF("暴力", "Anti-Aim"),"反自瞄")
        NM(RF("暴力", "反自瞄", "Enabled"),"启用")
        NM(RF("暴力", "反自瞄", "Pitch Angle"),"俯仰角")
        NM(RF("暴力", "反自瞄", "Yaw Angle"),"偏航角")
        NM(RF("暴力", "反自瞄", "Auto Direction"),"自动方向")
            NM(RF("暴力", "反自瞄", "自动方向", "At Edges"),"边缘藏头")
            NM(RF("暴力", "反自瞄", "自动方向", "At Targets"),"朝向目标")
        NM(RF("暴力", "反自瞄", "Disable Conditions"),"禁用条件")
            NM(RF("暴力", "反自瞄", "禁用条件", "On Use"),"使用时")
            NM(RF("暴力", "反自瞄", "禁用条件", "On Knife"),"持刀时")
            NM(RF("暴力", "反自瞄", "禁用条件", "On Grenade"),"手持投掷物时")
            NM(RF("暴力", "反自瞄", "禁用条件", "During Freeze Time"),"回合冻结时")
    NM(RF("暴力", "Auto Peek"),"自动Peek")
        NM(RF("暴力", "自动Peek", "Enable"),"启用")
        NM(RF("暴力", "自动Peek", "Key"),"热键")
        NM(RF("暴力", "自动Peek", "Show indicator"),"显示指示器")
        NM(RF("暴力", "自动Peek", "Type"),"类型")
        NM(RF("暴力", "自动Peek", "Maintain Origin"),"保持原位")
    NM(RF("暴力", "Accuracy"),"数值")
        for i = 1, 11, 1 do
            NM(RF("暴力", "数值", WeaponList[i], "Min Damage"),"最小伤害")
            NM(RF("暴力", "数值", WeaponList[i], "Min Damage Options", "Auto Wall"),"自动穿墙")
            NM(RF("暴力", "数值", WeaponList[i], "Min Damage Options", "Adaptive Damage"),"自适应伤害")
            NM(RF("暴力", "数值", WeaponList[i], "Hit Chance"),"命中率")
        end
    NM(RF("暴力", "Hitbox"),"部位")
        for i = 1, 11, 1 do
            NM(RF("暴力", "部位", WeaponList[i], "Head", "Priority"),"优先")
            NM(RF("暴力", "部位", WeaponList[i], "Head", "Exposed"),"暴露")
            NM(RF("暴力", "部位", WeaponList[i], "Head", "Center"),"中心")
            NM(RF("暴力", "部位", WeaponList[i], "Body", "Priority"),"优先")
            NM(RF("暴力", "部位", WeaponList[i], "Body", "Lethal"),"致命")
            NM(RF("暴力", "部位", WeaponList[i], "Body", "Exposed"),"暴露")
            NM(RF("暴力", "部位", WeaponList[i], "Body", "Center"),"中心")
            NM(RF("暴力", "部位", WeaponList[i], "Limbs", "Exposed"),"暴露")
            NM(RF("暴力", "部位", WeaponList[i], "Limbs", "Center"),"中心")
        end
    NM(RF("暴力", "Automate"),"自动")
        -- 自动急停
        for i = 1, 11, 1 do
            NM(RF("暴力", "自动", WeaponList[i], "Auto Stop"),"自动急停")
                NM(RF("暴力", "自动", WeaponList[i], "自动急停", "Stop"),"急停")
                NM(RF("暴力", "自动", WeaponList[i], "自动急停", "Slow Walk"),"慢走")
                NM(RF("暴力", "自动", WeaponList[i], "自动急停", "Duck"),"蹲下")
                NM(RF("暴力", "自动", WeaponList[i], "自动急停", "Early"),"提前")
                NM(RF("暴力", "自动", WeaponList[i], "自动急停", "Between Shots"),"射击间隙")
        end
        -- Shared
        NM(RF("暴力", "自动", "Shared", "Auto Fire"),"自动开火")
            NM(RF("暴力", "自动", "Shared", "自动开火", "Auto Pistol"),"自动手枪")
            NM(RF("暴力", "自动", "Shared", "自动开火", "Auto Revolver"),"左轮自动预热")
        NM(RF("暴力", "自动", "Shared", "Auto Scope"),"自动开关镜")
            NM(RF("暴力", "自动", "Shared", "自动开关镜", "Scope"),"自动开镜")
            NM(RF("暴力", "自动", "Shared", "自动开关镜", "Unscope"),"自动关镜")
        -- Pistol
        NM(RF("暴力", "自动", "Pistol", "Auto Fire"),"自动开火")
            NM(RF("暴力", "自动", "Pistol", "自动开火", "Auto Pistol"),"自动手枪")
        -- Heavy Pistol
        NM(RF("暴力", "自动", "Heavy Pistol", "Auto Fire"),"自动开火")
            NM(RF("暴力", "自动", "Heavy Pistol", "自动开火", "Auto Pistol"),"自动手枪")
            NM(RF("暴力", "自动", "Heavy Pistol", "自动开火", "Auto Revolver"),"左轮自动预热")
        -- Scout
        NM(RF("暴力", "自动", "Scout", "Auto Fire"),"自动开火")
            NM(RF("暴力", "自动", "Scout", "自动开火", "Auto Pistol"),"自动手枪")
        NM(RF("暴力", "自动", "Scout", "Auto Scope"),"自动开关镜")
            NM(RF("暴力", "自动", "Scout", "自动开关镜", "Scope"),"自动开镜")
            NM(RF("暴力", "自动", "Scout", "自动开关镜", "Unscope"),"自动关镜")
        -- Auto Sniper
        NM(RF("暴力", "自动", "Auto Sniper", "Auto Scope"),"自动开关镜")
            NM(RF("暴力", "自动", "Auto Sniper", "自动开关镜", "Scope"),"自动开镜")
            NM(RF("暴力", "自动", "Auto Sniper", "自动开关镜", "Unscope"),"自动关镜")
        -- Sniper
        NM(RF("暴力", "自动", "Sniper", "Auto Fire"),"自动开火")
            NM(RF("暴力", "自动", "Sniper", "自动开火", "Auto Pistol"),"自动手枪")
        NM(RF("暴力", "自动", "Sniper", "Auto Scope"),"自动开关镜")
            NM(RF("暴力", "自动", "Sniper", "自动开关镜", "Scope"),"自动开镜")
            NM(RF("暴力", "自动", "Sniper", "自动开关镜", "Unscope"),"自动关镜")

print("汉化已加载, 请勿重复加载脚本")