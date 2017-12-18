-- terrain example (not in current build yet)
b = BinooAPI
b:ClearObjects()

id="terrain"
size=100 -- in meters
px=-size/2
py=-20
pz=px
b:CreateTerrain(id,size,px,py,pz)

-- perlinnoise heightmap
b:SetTerrainHeightmapFromPerlinNoise(id,0.007,0.05)

-- hide photospheres, if in that mode
b:PhotoSphere_HideSpheres()

-- allow player to move by nodding head
b:TogglePlayerMovement(true)
b:SetPlayerMovementSpeed(15)
b:AddTerrainEdgeColliders(id)

x=0
z=0
y = b:GetTerrainWorldHeight(id,x,z)
--b:Log(y)

-- align cube on terrain surface
cube = "cube"
b:CreateCube(cube,1,1,1,x,y,z)
b:DropAndAlignObjectToTerrain(cube,id,0,0,0)

-- mainloop TODO
return function()
  while true do
    coroutine.yield(0.16)
  end
end
