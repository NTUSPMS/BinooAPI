--[[
Demonstration of a simple gameplay in VR
catch a green sphere within limited time
given by deltax in units of 0.12s
(c) EDU2VR 2017
--]]

b=BinooAPI
--b:DebugMode(true)

deltax = 300 -- time between two birds
radius = 10  -- radial position of the bird
score = 0 -- Number of birds
gothim = 0
no_bird = 3

color_bird = {{255,0,0},{0,255,0},{0,0,255}}
size_bird = {1.5,1,0.5}

function killbird(no)
    b:Destroy(tostring(no))    
end

function newbird(no)
    local phi = math.random(0,360)
    local theta = math.random(30,110)
    
    pos={radius*math.sin(phi*math.pi/180)*math.cos(theta*math.pi/180),
        radius*math.sin(phi*math.pi/180)*math.sin(theta*math.pi/180),
        radius*math.cos(phi*math.pi/180)}
    
    b:CreateSphere(tostring(no),size_bird[no],pos[1],pos[2],pos[3])
    b:SetColor(tostring(no),color_bird[no][1],color_bird[no][2],color_bird[no][3])
    b:AddGazeTarget(tostring(no))
    b:AddEvent(tostring(no),"GAZEENTER","GotBird" .. tostring(no))
end

function GotBird1()
    score = score + 1
    b:ShowMessage("Score " .. tostring(score) .. "!")
    b:PlaySound("bam1")
    gothim = 1
end

function GotBird2()
    score = score + 2
    b:ShowMessage("Score " .. tostring(score) .. "!")
    b:PlaySound("ding1")
    gothim = 2
end

function GotBird3()
    score = score + 3
    b:ShowMessage("Score " .. tostring(score) .. "!")
    b:PlaySound("ding2")
    gothim = 3
end


b:ShowMessage("Catch 10 Marsmen to reach MARS!")

-- Game starts with generating birds
for i =1, no_bird do
    newbird(i)
end

return function()
    local x = 0
    -- the actual loop code
    while true do
        x = x + 1
        if gothim>0 then
            if score>10 then
                 b:PhotoSphere_Goto(4)
            end
            killbird(gothim)
            newbird(gothim)
            gothim = 0
            x=0
        end
        -- timeout about 8 secs
        if x>deltax then
            b:ShowMessage("Too slow, marsmen attack!")
            b:PlaySound("lose1")
            for i=1,no_bird do
                killbird(i)
                newbird(i)
            end
            x = 0
            score = 0
        end
        coroutine.yield(0.1)
    end
end
