-- terrain example
b = BinooAPI
b:ClearObjects()

-- hide photospheres, if in that mode
b:PhotoSphere_HideSpheres()

id="terrain"
size=100 -- in meters
maxheight=50
px=-size/2
py=-20
pz=px
b:CreateTerrain(id,size,px,py,pz,maxheight)

-- perlinnoise heightmap
--b:SetTerrainHeightmapFromPerlinNoise(id,0.007,0.05)
-- using heightmap texture, need to wait for it to finish
url = "http://www.alvaromartin.net/images/surfaceclipmaps/heightmap.jpg"
b:SetWaitForMe(true)
b:SetTerrainHeightmap(id, url, 0.25)

-- mainloop TODO
return function()
    
    -- wait until terrain data is loaded
    while b:WaitForMe()==true do
        coroutine.yield(0.2)
    end
    
    
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
    align=true
    b:DropObjectToTerrain(cube,id,0,0,align)
    
  while true do
    coroutine.yield(0.16)
  end
end
