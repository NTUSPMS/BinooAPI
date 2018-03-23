-- creates button that can be used to toggle between vr mode on/off
b = BinooAPI
id = "button"
--  returns true for vr cardboard, false if vr off
vrmode = b:GetVRMode()
b:CreateToggleButton(id,"VR Mode")
b:SetPosition(id,5,0,5)
b:SetToggleButton(id,vrmode)
b:AddEvent(id,"CLICK","MyClick")

function MyClick(sender)
    vrmode = not vrmode
    b:ToggleVR(vrmode)
end
