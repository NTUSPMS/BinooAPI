b = BinooAPI

b:CreateSphere("sphere",2,3,0,0)
b:AddGazeTarget("sphere")
b:AddEvent("sphere","CLICK","MyClickEvent")

function MyClickEvent(sender)
    b:PhotoSphere_ClearAllObjects()
    b:PlayVideo360("yarcdW91djQ")
    b:Destroy(sender)
end
