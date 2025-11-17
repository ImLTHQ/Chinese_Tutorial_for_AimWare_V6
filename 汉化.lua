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
                NM(RF("合法", "武器","压枪", WeaponList[i], "Recoil Control System"),"压枪时机")
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
                NM(RF("合法", "武器", "瞄准", WeaponList[i], "Randomize Factor"),"随机因子")
                NM(RF("合法", "武器", "瞄准", WeaponList[i], "Curve Factor"),"曲线因子")
            end
        NM(RF("合法", "武器", "Visibility"),"可见性")
            for i = 1, 11, 1 do
                NM(RF("合法", "武器", "可见性", WeaponList[i], "Auto Wall"),"穿墙")
                NM(RF("合法", "武器", "可见性", WeaponList[i], "Through Smoke"),"穿烟")
            end