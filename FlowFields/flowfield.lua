-- WIP flowfield example (use build v304 or later)
b = BinooAPI
b:ClearObjects()

id = "flowfield"
-- params: id, arraySize (x*x*x), worldSize (in meters, not used yet) 
b:CreateFlowField(id,5,5)

-- params: id, indexX, indexY, indexZ, length
--b:SetFlowFieldCellLength(id,0,0,0,0.2)
--b:SetFlowFieldCellLength(id,0,0,1,0.2)
-- params: id, indexX, indexY, indexZ, angleX, angleY, angleZ (in euler angles)
--b:SetFlowFieldCellRotation(id,0,0,0,0,-90,0)
-- params: id, indexX, indexY, indexZ, red, green, blue, alpha=255 (0-255)
--b:SetFlowFieldCellColor(id,0,0,0,255,0,0,255)

targetid = "sphere"
b:CreateSphere(targetid,0.2,0,1,0)
b:SetColor(targetid,255,0,0)

-- all arrows will point towards target gameobject
b:SetFlowFieldCellsTowards(id,targetid)

-- set arrow lenghts from distance to target
scale = 1
b:SetFlowFieldLengthsFromDistance(id,targetid,scale)
-- color is: R G B Alpha
nearcolor={255,0,0,255}
farcolor={0,255,0,255}
b:SetFlowFieldColorsFromDistance(id,targetid,nearcolor,farcolor)

--make sphere follow the field movement (by parenting it)
b:SetParent(targetid,id)
b:TweenMoveX(id,-5,5)

-- init mainloop
return function()
  -- wait x secs
  coroutine.yield(5)
  -- then scale whole field and child object
  b:TweenScale(id,0.2,3)

  -- reset all cells: colors, rotations, lengths
--  b:SetFlowFieldCellLengths(id,0.1)
--  b:SetFlowFieldCellRotations(id,0,0,0)
--  b:SetFlowFieldCellColors(id,255,255,255,255)

  -- main loop
  while true do
    coroutine.yield(0.16)
  end
end
