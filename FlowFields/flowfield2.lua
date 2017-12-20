-- WIP flowfield example (use build v304 or later)
b = BinooAPI
b:ClearObjects()
b:DebugMode(true)

id = "flowfield"
-- params: id, arraySize (x*x*x), worldSize (in meters, not used yet) 
size = 5
b:CreateFlowField(id,size,0)

targetid = "sphere"
sx = 0
sy = 0
sz = 0
b:CreateSphere(targetid,0.2,sx,sy,sz)
b:SetColor(targetid,255,0,0)

--b:Log("here")

-- params: id, indexX, indexY, indexZ, length
for z=0, size-1 do
    for y=0, size-1 do
        for x=0, size-1 do
            -- get distance to sphere for this cell
            dist = b:GetDistance(x-size/2,y-size/2,z-size/2,sx,sy,sz)
            -- get angle towards sphere from this cell
            b:SetFlowFieldCellRotationTowards(id,targetid,x,y,z)
            b:SetFlowFieldCellLength(id,x,y,z,dist*0.2)
            -- color by distance to target
            nearcolor={255,0,0,255}
            farcolor={0,255,0,255}
            b:SetCellColorFromDistanceToObject(id,targetid,x,y,z,nearcolor,farcolor)
        end
    end
end

-- scale flowfield
--b:ScaleObject(id,2,2,2) 

--make sphere follow the field movement (by parenting it) if need to move
--b:SetParent(targetid,id)

-- init mainloop
return function()
  -- wait x secs
  coroutine.yield(5)

  -- main loop
  while true do
    coroutine.yield(0.16)
  end
end
