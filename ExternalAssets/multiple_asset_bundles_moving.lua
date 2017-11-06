b = BinooAPI

ff = {}
ff[1]={fname=b:GetAssetURL("Plants%20and%20Animals/Tropicalfish%2003"),
    initangle = 0, radius = 6, speed = .5, height = 1, counter = 0, dir = 1}
ff[2]={fname=b:GetAssetURL("Plants%20and%20Animals/Tropicalfish%2002"),
    initangle = 90, radius = 12, speed = .3, height = 5, counter = 0, dir = -1}
ff[3]={fname=b:GetAssetURL("Plants%20and%20Animals/Tropicalfish%2001"),
    initangle = 45, radius = 8, speed = .7, height = 2, counter = 0, dir = 1}
ff[4]={fname=b:GetAssetURL("Plants%20and%20Animals/Humpback%20whale"),
    initangle = -45, radius = 12, speed = .2, height = 4, counter = 0, dir = -1}

for k,v in ipairs(ff) do
    b:LoadBundle(v.fname,tostring(k))
end

return function()
    while true do
        for k,v in ipairs(ff) do 
            if b:FindObject(v.name) then
                angel = (v.counter*v.speed + v.initangle)*math.pi/180*v.dir
                if v.x == 0 then
                    b:MoveObject(tostring(k), v.radius*math.sin(angel), v.height, v.radius*math.cos(angel))
                else
                    b:TweenMove(tostring(k), v.radius*math.sin(angel), v.height , v.radius*math.cos(angel),0.1)
                end
                b:SetRotation(tostring(k), 0, angel/math.pi*180-v.dir*90, 0) -- would be nice to have a Tween for rot
                v.counter = v.counter + 1
            end
        end
        coroutine.yield(0.1)
    end
end

