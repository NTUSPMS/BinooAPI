b = BinooAPI
-- loads external OBJ file, and sets gameobject name to "cow"
b:LoadOBJ("http://www.starscenesoftware.com/objtest/Spot.obj","cow")

-- command works also
--b:SendCommand("LOADOBJ|http://www.starscenesoftware.com/objtest/Spot.obj|cow")

return function()
  -- wait until gameobject "cow" exists
  while b:FindObject("cow")==false do
    coroutine.yield(1)
  end

  b:TweenMove("cow",20,0,0,20)

  -- mainloop
  while true do
    coroutine.yield(0.16)
  end
end
