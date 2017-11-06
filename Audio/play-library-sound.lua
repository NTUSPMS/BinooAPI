-- creates 2 buttons, each one plays different sound from library
b = BinooAPI
id = "button"
b:CreateButton(id,"Sound1")
b:SetPosition(id,5,0,5)
b:AddEvent(id,"CLICK","MyClick","idea")

id = "button2"
b:CreateButton(id,"Sound2")
b:SetPosition(id,5,1,5)
b:AddEvent(id,"CLICK","MyClick","tadaa_trumpet")

function MyClick(sender,param)
    b:PlaySound(param)
end
