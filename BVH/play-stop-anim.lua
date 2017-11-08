-- instantiates lowpoly character, loads bvh animation to it, adds 2 buttons to play/stop character animation
b = BinooAPI
b:ClearObjects()

target = "mocapdude"
stringkey = "mybvh"
zisup=true

b:SetWaitForMe(true)
b:LoadStringFromURL("https://gist.githubusercontent.com/unitycoder/cc5e1e171a2218a85dad7ca3bc652bec/raw/5a6629176cf05d808e1c9aae165f8ea13b8ab856/test5.bvh",stringkey)
b:Instantiate("models/lowpolyrig",target)

b1="button1"
b:CreateButton(b1,"Stop")
b:SetPosition(b1,-12,1,-5)
b:AddEvent("button1","CLICK","StopAnim")

b2="button2"
b:CreateButton(b2,"Play")
b:SetPosition(b2,-12,1,5)
b:AddEvent("button2","CLICK","PlayAnim")

function StopAnim(sender)
    b:StopAnimation(target)
end

function PlayAnim(sender)
    b:PlayAnimation(target)
end


return function()
  -- wait until string data is loaded
  while b:WaitForMe()==true do
    coroutine.yield(0.2)
  end

  b:ShowMessage("Finished loading...");
  b:ParseBVHFromString(target,stringkey,false,true)
  b:SetPosition(target,-3,0,0)
  b:RotateTowardsPlayer(target)

  -- mainloop slowly rotate
  while true do
    b:RotateY(target,1)
    coroutine.yield(0.2)
  end
end
