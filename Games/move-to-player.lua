-- loads model, waits random time, animates model towards player
b = BinooAPI
id="butter"
b:LoadBundle(b:GetAssetURL("Plants%20and%20Animals/Spider_walk"),id)


return function()
  -- wait until model is loaded
  while b:FindObject(id)==false do
    coroutine.yield(0.1)
  end
  coroutine.yield(1.5)
  
  -- hide
  b:SetPosition(id,-20,0,-20)
  
  -- wait random amount
  coroutine.yield(math.random(5,20))
  
  -- animate towards player
  b:TweenMove(id,0,0,0,10)

  -- look towards plyaer
  while true do
    b:RotateTowardsPlayer(id)
    coroutine.yield(0.1)
  end
end
