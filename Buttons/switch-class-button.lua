b = BinooAPI
id = "button"
b:CreateButton(id,"Click!")
b:SetPosition(id,4,0,4)
b:AddEvent(id,"CLICK","MyClick")

function MyClick(sender)
    b:JoinClass("129")
end
