local RF=gui.Reference

local WeaponList={"通用","电击枪","手枪","沙鹰与R8","冲锋枪","步枪","散弹枪","鸟狙","连狙","大狙","机枪"}

local function NM(RFName,SetName)  RFName:SetName(SetName)  end

---

NM(RF("Legitbot"),"合法")

    NM(RF("合法", "Aimbot"),"自瞄")
        NM(RF("合法", "自瞄", "Main"),"主要")

    NM(RF("合法", "Triggerbot"),"扳机")
    NM(RF("合法", "Weapon"),"武器")