b = BinooAPI
b:ClearObjects()
b:PhotoSphere_HideSpheres()
id="terrain"
size=100
maxheight=50
px=-size/2
py=-20
pz=px
b:CreateTerrain(id,size,px,py,pz,maxheight)
b:SetTerrainTextureFromLibrary(id,"grass")
url = "http://www.alvaromartin.net/images/surfaceclipmaps/heightmap.jpg"
b:SetWaitForMe(true)
b:SetTerrainHeightmap(id, url, 0.25)

return function()
    -- wait until terrain height data is loaded
    while b:WaitForMe()==true do
        coroutine.yield(0.2)
    end
    -- add trees
    b:AssignTerrainTree(id,"library/terrain/pinetree",0)
    
    -- load and wait for treemap texture
    b:SetWaitForMe(true)
    b:SetTerrainTreemap(id,url,0.1,0.1,1,true)
    while b:WaitForMe()==true do
        coroutine.yield(0.2)
    end

    -- allow player to move by nodding head
    b:TogglePlayerMovement(true)
    b:SetPlayerMovementSpeed(10)
    b:AddTerrainEdgeColliders(id)
  while true do
    coroutine.yield(0.16)
  end
end
