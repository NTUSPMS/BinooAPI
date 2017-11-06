-- 'sender' event only works in v2.34 or later
b = BinooAPI
b:SendCommand("MESSAGE|HelloWorld!")
b:CreateSphere("sphere",2,3,0,0)
b:AddGazeTarget("sphere")
b:AddEvent("sphere","CLICK","MyClickEvent")

b:CreateSphere("box",2,4,0,0)
b:AddGazeTarget("box")
b:AddEvent("box","CLICK","MyClickEvent")

-- 'sender' is name of the gameobject who called this function
function MyClickEvent(sender)
    b:SendCommand("MESSAGE|clicked "..tostring(sender))
    b:Destroy(tostring(sender))
end
