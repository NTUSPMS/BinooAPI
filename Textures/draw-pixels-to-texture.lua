-- draw random colored pixels to texture (that is assigned to cube)
b = BinooAPI
b:CreateCube("box",1,1,1,3,0,0)
b:CreateTexture("tex1",32,32)
b:ClearTexture("tex1",0,0,0)
b:AssignTexture("box","tex1")

return function()
    while true do
        b:SetPixel("tex1",math.random(0,31),math.random(0,31),math.random(0,255),math.random(0,255),math.random(0,255))
        coroutine.yield(0.2)
    end
end
