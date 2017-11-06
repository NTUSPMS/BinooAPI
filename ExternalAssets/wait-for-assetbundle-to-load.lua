-- waits for assetbundle to load in the first while loop
b = BinooAPI

id = "skull"
b:LoadBundle(b:GetAssetURL("Fossils%20and%20Skeletons/Dinosaur%20skull"),id)

return function()
  -- wait until model is loaded
  while b:FindObject(id)==false do
    coroutine.yield(0.1)
  end
  
  -- assetbundle gameobject is now available 
  b:TweenMove(id,10,0,0,10)
  
  -- could have mainloop here
--  while true do
--    coroutine.yield(0.1)
--  end
  
end
