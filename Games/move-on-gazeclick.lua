-- create box, that moves and rotates in localspace when gazeclicked
b = BinooAPI

id = "box"
b:CreateBox(id,2,1,1,2,2,2)
b:AddCollider(id,"BOX")
b:AddGazeTarget(id)
b:MoveObject(id,0,0,5)
b:AddEvent(id,"CLICK","MyClick")

function MyClick(sender, param)
    t = tostring(sender)
    b:PlaySound("blip_button1")
    b:MoveZ(t,1)
    b:RotateY(t,45)
end
