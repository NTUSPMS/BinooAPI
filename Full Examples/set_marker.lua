--[[
ff table holds marker to be found in the scene
--]]

b = BinooAPI
b:DebugMode(true)

ff = {}
-- c = 0 -> wrong marker
-- c = 1 -> correct marker
-- anim = true/false -> animated marker/fixed marker
-- anims = 0/1 -> increase first/decrease first, helper variable to control animation
ff[1] = { phi=0, theta = 0, c = 0, anim = true, anims = 0}
ff[2] = { phi=0, theta = 20, c = 1, anim = true, anims = 0}
ff[3] = { phi=0, theta = -20, c = 1, anim = true, anims = 0}

--radius where the objects are placed
r = 13 -- radius where markers are placed
rs = 1.1 -- size of the marker
tf = 0 -- total number of markers to be found; is calculated below
pi = math.pi

for k,v in ipairs(ff) do
    b:CreateGameObject(tostring(k))
    b:AddBoxCollider(tostring(k), 0, 0, 0, rs, rs, rs)
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
    local objname = "s" .. sender
    if b:FindObject(objname) then
        b:Destroy(objname)
    else
        sn = tonumber(sender)
        v=ff[sn]
        b:CreateTorus(objname, 0, 45, rs, rs/4, 32, 16)
        b:SetPosition(objname, 
            r*math.cos(v.phi*pi/180),
            r*math.sin(v.theta*pi/180),
            r*math.sin(v.phi*pi/180))
        b:SetRotation(objname, 0, 0, 90)
        b:SetColor(objname, 242, 239, 29) -- yellow
    end
    
end


return function()
    
    while true do
        local f = true
        local f_f = 0
        
        -- check for objects and animate 
        for k,v in ipairs(ff) do
            if b:FindObject("s" .. tostring(k)) then
                -- check if object should be animated
                --if ff[k].anim then 
                    if (ff[k].anims == 1) then
                        b:TweenScale("s" .. tostring(k), 1.1, 1)
                        ff[k].anims = 0
                    else
                        b:TweenScale("s" .. tostring(k), 0.9, 1)
                        ff[k].anims = 1                
                    end
                --end
                if (v.c == 0) then 
                    -- wrong object found
                    f = false
                elseif (v.c == 1) then
                    f_f = f_f +1
                end
            elseif (v.c == 1) then
                -- object not yet marked
                f = false
            end
        end
    
        if (f == true) and (f_f == tf) then
            b:SendCommand("MESSAGE|all objects found")
        end
            
        coroutine.yield(1)
  end
end

