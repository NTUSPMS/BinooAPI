b = BinooAPI
--b:DebugMode(true)

ff = {}
-- c = 0 -> wrong marker
-- c = 1 -> correct marker

ff[1] = { phi=0, theta = 0, c = 0}
ff[2] = { phi=0, theta = 20, c = 1}
ff[3] = { phi=0, theta = -20, c = 1}

--radius where the objects are placed
r = 14
rs = 1
pi  = math.pi
tf = 0 -- number of objects to be found

for k,v in ipairs(ff) do
    b:CreateGameObject(tostring(k))
    b:AddBoxCollider(tostring(k), 0, 0, 0, 1, 1, 1)
    b:MoveObject(tostring(k), 
        r*math.cos(v.phi*pi/180),
        r*math.sin(v.theta*pi/180),
        r*math.sin(v.phi*pi/180))
    b:AddGazeTarget(tostring(k))
    b:AddEvent(tostring(k),"CLICK","myclick")
    if v.c == 1 then 
        tf = tf + 1
    end
end
b:SendCommand("MESSAGE|find " .. tostring(tf) .. " objects.")

function myclick(sender)
    if b:FindObject("s" .. sender) then
        b:Destroy("s" .. sender)
    else
        sn = tonumber(sender)
        v=ff[sn]
        b:CreateSphere("s" .. sender, rs, 
            r*math.cos(v.phi*pi/180),
            r*math.sin(v.theta*pi/180),
            r*math.sin(v.phi*pi/180))
    end
    -- determine if all objects have been found
 
end


return function()
    
    while true do
        local f = true
        local f_f = 0
        for k,v in ipairs(ff) do
            -- wrong object found
            if (v.c == 0) and (b:FindObject("s" .. tostring(k)) == true) then
                f = false
            end
            -- missing objects
            if (v.c == 1) and (b:FindObject("s" .. tostring(k)) == false) then
                f = false
            end
            
            if (v.c == 1)  and (b:FindObject("s" .. tostring(k)) == true) then
                f_f = f_f +1
            end
        end
    
        if (f == true) and (f_f == tf) then
            b:SendCommand("MESSAGE|all objects found")
        end
            
        coroutine.yield(1)
  end
end
