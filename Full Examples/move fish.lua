b = BinooAPI
--b:DebugMode(true)

ff = {}
ff[1]={fname=b:GetAssetURL("Plants%20and%20Animals/Tropicalfish%2003"),
    initangle = 180, cangle = 0, initialrot = 0, size = 1, radius = 6, speed = .5, height = 1, counter = 0, dir = 1, anim = 0}
ff[2]={fname=b:GetAssetURL("Plants%20and%20Animals/Tropicalfish%2002"),
    initangle = 120, cangle = 0, initialrot = 0, size = 1, radius = 12, speed = .3, height = 5, counter = 0, dir = -1, anim = 0}
ff[3]={fname=b:GetAssetURL("Plants%20and%20Animals/Tropicalfish%2001"),
    initangle = 90, cangle = 0, initialrot = 0, size = 1, radius = 8, speed = .7, height = 2, counter = 0, dir = 1, anim = 0}
ff[4]={fname=b:GetAssetURL("Plants%20and%20Animals/Humpback%20whale"),
    initangle = 0, cangle = 0, initialrot = 0, size = 1, radius = 12, speed = .2, height = 4, counter = 0, dir = -1, anim = 1}
ff[5]={fname=b:GetAssetURL("Edu2VR"),
    initangle = -45, cangle = 0, initialrot = 90, size = .4, radius = 4, speed = .1, height = -2.5, counter = 0, dir = 1, anim = 0}

for k,v in ipairs(ff) do
    b:LoadBundle(v.fname,tostring(k))
end

function StartAnim(obj)
    if ff[tonumber(obj)].anim == 2 then
        ff[tonumber(obj)].anim = 3
        b:PlaySynth("2,0.2714,0.1795,0.0024,0.3443,0.503,,-0.0033,-0.2249,0.3023,-0.8502,0.4739,0.7945,,-0.2048,0.8226,,-0.6546,0.8745,-0.5804,,0.504,-0.1882,0.5")
    end
end

return function()
    rotspeed = 1
    headspeed = 0.1
    -- wait until all models have loaded
    loading = true
    while loading do
        loaded = true
        for k,v in ipairs(ff) do
            oname = tostring(k)
            if b:FindObject(oname)==false then 
                loaded = false
                break
            end
        end
        if loaded then loading = false end
        coroutine.yield(1)
    end

    coroutine.yield(1)
    
    -- adding colliders/events and placing/scaling
    for k,v in ipairs(ff) do
        oname = tostring(k)
        if v.anim == 1 then
            b:AddGazeTarget(oname)
            b:AddEvent(oname,"CLICK","StartAnim")
            v.anim = 2
        end
        angle_rad = v.initangle*math.pi/180*v.dir
        b:MoveObject(oname, v.radius*math.sin(angle_rad), v.height, v.radius*math.cos(angle_rad))
        b:ScaleObject(oname, v.size, v.size, v.size)
    end
    
    b:SendCommand("MESSAGE|The Mammal can be lured.")
    
    while true do
        for k,v in ipairs(ff) do
            oname = tostring(k)
            if v.anim < 3 then
                angle_rad = (v.initangle+v.counter*v.speed*v.dir)*math.pi/180
                b:TweenMove(oname, v.radius*math.sin(angle_rad), v.height , v.radius*math.cos(angle_rad), 0.1)
                b:SetRotation(oname, 0, angle_rad/math.pi*180-v.dir*90+v.initialrot, 0)
                v.counter = v.counter + 1
            elseif v. anim == 3 then -- prepare rotation of the object to the viewer
                v.cangle = v.counter*v.speed*v.dir + v.initangle
                v.counter = 0
                v.anim = 4
            elseif v.anim == 4 then -- rotate the object to the viewer
                angle = v.cangle - v.dir*90  + v.initialrot + v.counter*v.dir
                b:TweenRotate(oname, 0, angle, 0, 0.1) 
                v.counter = v.counter + rotspeed
                if v.counter > 90 then
                    v.anim = 5
                    v.counter = 0
                end
            elseif v.anim == 5 then -- move the object over the head
                newradius = v.radius - v.counter
                b:TweenMove(oname, newradius*math.sin(v.cangle*math.pi/180), v.height, 
                    newradius*math.cos(v.cangle*math.pi/180), 0.1)
                v.counter = v.counter + headspeed
                if newradius < -v.radius then
                    v.anim = 6
                    v.counter = 0
                end
            elseif v.anim == 6 then -- rotate it back
                angle = v.cangle - v.dir*90  + v.initialrot - 90 + v.counter*v.dir
                b:TweenRotate(oname, 0, angle, 0, 0.1) 
                v.counter = v.counter + rotspeed
                if v.counter > 90 then -- start all over again
                    v.anim = 2
                    v.counter = 0
                    v.initangle = v.cangle + 180.
                end   
                
            end
        end
        coroutine.yield(0.1)
    end
end
