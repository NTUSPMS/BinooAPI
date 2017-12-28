-- create sphere targets that player can jump between them using TweenMovePlayer()
b = BinooAPI
b:ClearObjects()
b:PhotoSphere_HideSpheres()

CreateJumpTarget("middle",0,0,0,0,0,255)
CreateJumpTarget("left",-10,0,0,0,255,0)
CreateJumpTarget("right",10,0,0,255,0,0)
CreateJumpTarget("front",0,0,10,255,255,0)
CreateJumpTarget("back",0,0,-10,0,255,255)

function JumpTo(sender)
    p = b:GetPosition(tostring(sender))
    if p[0]~=-1 and p[1]~=-1 and p[2]~=-1 then
        b:TweenMovePlayer(p[0],p[1],p[2],2)
    end
end

function CreateJumpTarget(target,posx,posy,posz,red,green,blue)
    b:CreateSphere(target,0.5,posx,posy,posz)
    b:SetColor(target,red,green,blue)
    b:AddGazeTarget(target)
    b:AddEvent(target,"CLICK","JumpTo")
end

-- init mainloop
return function()
  -- main loop
  while true do
    coroutine.yield(0.2)
  end
end
