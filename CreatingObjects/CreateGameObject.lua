-- creates empty gameobject (invisible) adds collider and event to it
b = BinooAPI

id = "box"
b:CreateGameObject(id)
b:MoveObject(id,5,0,0)
b:AddBoxCollider(id, 0, 0, 0, 1,1,1)
b:AddGazeTarget(id)
b:AddEvent(id,"CLICK","MyClick",100)

-- click event with param
function MyClick(sender, param)
    b:SendCommand("MESSAGE|clicked "..tostring(sender).." with param "..tostring(param))
end
