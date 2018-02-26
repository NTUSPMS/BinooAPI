-- plays only part of the animation, by manually rewinding then played x seconds
b = BinooAPI
b:ClearObjects()
target = "mocapdude"
stringkey = "mybvh"
zisup=true
b:SetWaitForMe(true)
b:LoadStringFromURL("https://gist.githubusercontent.com/unitycoder/cc5e1e171a2218a85dad7ca3bc652bec/raw/5a6629176cf05d808e1c9aae165f8ea13b8ab856/test5.bvh",stringkey)
b:Instantiate("models/lowpolyrig",target)

return function()
  while b:WaitForMe()==true do
    coroutine.yield(0.2)
  end
  b:ParseBVHFromString(target,stringkey,false,true)
  b:SetPosition(target,-3,0,0)
  b:RotateTowardsPlayer(target)
  -- get full animation length in seconds
  l = b:GetAnimationLength(target)
  timeEnd = l/3 -- play only 1/3
  while true do
    t = b:GetAnimationTime(target)
    -- if reach time end, rewind to 0
    if t>timeEnd then
        b:JumpToAnimationTime(target,0)
    end
    coroutine.yield(0.16)
  end
end
