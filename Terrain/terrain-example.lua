-- terrain example (not in current build yet)
b = BinooAPI

id="terrain"
size=100 -- in meters
px=-size/2
py=-10
pz=px
b:CreateTerrain(id,size,px,py,pz)

-- hide photospheres, if in that mode
b:PhotoSphere_HideSpheres()

-- allow player to move by nodding head
b:TogglePlayerMovement()

-- mainloop TODO
return function()
  while true do
    coroutine.yield(0.16)
  end
end
