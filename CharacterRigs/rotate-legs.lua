b = BinooAPI
b:ClearObjects()

target = "mocapdude"

b:Instantiate("models/lowpolyrig",target)
--b:Instantiate("models/taichiguy1",target)

return function()
  coroutine.yield(2)

  b:SetPosition(target,-3,0,0)
  b:RotateTowardsPlayer(target)

  -- mainloop slowly rotate legs
  while true do
    b:RotateX("mocapdude/Reference/Hips/LeftHip",-10)
    b:RotateX("mocapdude/Reference/Hips/RightHip",-10)
    coroutine.yield(0.2)
  end
end
