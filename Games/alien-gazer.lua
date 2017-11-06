-- spawns aliens, if gazed they turn towards player, and slide to 0,0,0 position
b = BinooAPI
id="alien"
b:LoadBundle(b:GetAssetURL("Alien"),id)
b:ShowMessage("Gaze to say Hi!")

-- gaze event
function OnGaze(sender)
    target = tostring(sender)
    b:RemoveGazeTarget(target)
    b:PlaySound("reveal")
    -- get position, and rotate towards 0,0,0
    b:RotateTowardsPlayer(target)
    --b:TweenMove(target,0,0,0,math.random(3,7))
end


return function()
    -- wait until model is loaded
    while b:FindObject(id)==false do
        coroutine.yield(0.2)
    end
    coroutine.yield(2)

    -- clone to random positions
    total = 3
    for i=1, total do
        newId = id..tostring(i)
        b:Clone(id,newId)
        coroutine.yield(0.1)
        -- place on sphere
        r = i/total
        b:PlaceObjectOnSphere(newId,r,0.47,math.random(4,8))
        -- add gaze target and gaze event
        b:AddGazeTarget(newId)
        b:AddEvent(newId,"GAZEENTER","OnGaze")
    end
    
    -- remove original
    b:Destroy(id)

    -- we need to keep looping, otherwise error msg in lua
    while true do
        coroutine.yield(0.5)
    end

end
