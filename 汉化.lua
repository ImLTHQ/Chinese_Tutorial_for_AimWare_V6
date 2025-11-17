local WeaponList={"Shared","Zeus","Pistol","Heavy Pistol","Submachine Gun","Rifle","Shotgun","Scout","Auto Sniper","Sniper","Light Machine Gun"}

local RF=gui.Reference

local function NM(RFName,SetName)  RFName:SetName(SetName)  end

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
    NM(RF("合法", "Weapon"),"武器")