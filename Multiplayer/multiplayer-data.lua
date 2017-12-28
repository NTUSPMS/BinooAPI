-- on sphere click, print to log some multiplayer information (count, userid's, positions)
b = BinooAPI
b:ClearObjects()
b:PhotoSphere_HideSpheres()
b:ShowOtherPlayers()

-- note after player joins, there is 15sec delay before he is spawned to clients
function Clicked()
    b:Log(b:GetAmountOfConnectedPlayers().." players logged in")
    names = b:GetPlayerNames()
    for nameIndex = 1, #names do
        name = names[nameIndex]
        -- current client
        if nameIndex==1 then
            p = b:GetPlayerPosition()
        else -- other players
            p = b:GetPlayerPosition(name);
        end
        b:Log(name.." at "..tostring(p[1])..","..tostring(p[2])..","..tostring(p[3]))
    end
end

target = "box"
b:CreateSphere(target,0.5,0,0,10)
b:SetColor(target,255,0,0)
b:AddGazeTarget(target)
b:AddEvent(target,"CLICK","Clicked")

return function()
  -- main loop
  while true do
    coroutine.yield(0.2)
  end
end
