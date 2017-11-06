--[[
Demonstration of a simple gameplay in VR
catch a green sphere within limited time
given by deltax in units of 0.12s
(c) EDU2VR 2017
--]]

b=BinooAPI

--b:DebugMode(true)

sound_laser = "0,.5,,.111,.1587,.3237,.3,.6699,.2,-.3305,,,,,,,,,,,.7683,-.5274,,,,1,,,.2155,,,"
sound_explosion = "3,.5,,.1525,.7683,.3475,.3,.6844,,-.3436,,,,,,,.1537,.6979,,,,,,,,1,,,,,,"

deltax = 300 -- time between two birds
radius = 10  -- radial position of the bird
score = 0 -- Number of birds

end_game = false
--asset_spider = "https://binoo.edu2vr.com/public/asset-bundle/android/Plants%20and%20Animals/Spider_walk"

ff = {} 
ff[1]={initangle = 10, cangle = 0, initialrot = 0, size = .16, radius = 8, speed = 1, height = 0, counter = 0, dir = 1, anim = 1}
ff[2]={initangle = -20, cangle = 0, initialrot = 140, size = .19, radius = 8, speed = 1, height = 0.5, counter = 0, dir = -1, anim = 1}
ff[3]={initangle = 30, cangle = 0, initialrot = 30, size = .13, radius = 8, speed = 1, height = 0.7, counter = 0, dir = 1, anim = 1}
ff[4]={initangle = -40, cangle = 0, initialrot = 190, size = .2, radius = 8, speed = 1, height = 0.3, counter = 0, dir = -1, anim = 1}
ff[5]={initangle = 50, cangle = 0, initialrot = 0, size = .16, radius = 8, speed = 1, height = 0, counter = 0, dir = 1, anim = 1}
ff[6]={initangle = -60, cangle = 0, initialrot = 140, size = .19, radius = 8, speed = 1, height = 0.5, counter = 0, dir = -1, anim = 1}
ff[7]={initangle = 70, cangle = 0, initialrot = 30, size = .13, radius = 8, speed = 1, height = 0.7, counter = 0, dir = 1, anim = 1}
ff[8]={initangle = -80, cangle = 0, initialrot = 190, size = .2, radius = 8, speed = 1, height = 0.3, counter = 0, dir = -1, anim = 1}
ff[9]={initangle = 90, cangle = 0, initialrot = 0, size = .16, radius = 8, speed = 1, height = 0, counter = 0, dir = 1, anim = 1}
ff[10]={initangle = -100, cangle = 0, initialrot = 140, size = .19, radius = 8, speed = 1, height = 0.5, counter = 0, dir = -1, anim = 1}
ff[11]={initangle = 110, cangle = 0, initialrot = 30, size = .13, radius = 8, speed = 1, height = 0.7, counter = 0, dir = 1, anim = 1}
ff[12]={initangle = -120, cangle = 0, initialrot = 190, size = .2, radius = 8, speed = 1, height = 0.3, counter = 0, dir = -1, anim = 1}


function GotBird(birdno)
	score = score + 1
	b:ShowMessage("Score " .. tostring(score) .. "!")
	b:PlaySynth(sound_explosion)
	ff[tonumber(birdno)].anim = 3 --explosion
end

function IniitBirds()
	for k,v in ipairs(ff) do
		v.radius = 5
	end
end

b:LoadBundle(b:GetAssetURL("Plants%20and%20Animals/Spider_walk"),tostring(1))
	
b:ShowMessage("Shoot 10 Space spiders to leave!")


return function()
	-- wait until all models have loaded
	while b:FindObject(tostring(1)) == false do
		coroutine.yield(1)
	end
	
	coroutine.yield(2)
	
	for k,v in ipairs(ff) do
		if k>1 then
			b:Clone(tostring(1),tostring(k))
		end
	end

    -- extra delay test
	coroutine.yield(3)
	
	-- adding colliders/events and placing/scaling
	for k,v in ipairs(ff) do
		oname = tostring(k)
		if v.anim == 1 then
			b:AddGazeTarget(oname)
			b:AddEvent(oname,"GAZEENTER","GotBird")
			v.anim = 2
		end
		angle_rad = v.initangle*math.pi/180*v.dir
		b:MoveObject(oname, v.radius*math.sin(angle_rad), v.height, v.radius*math.cos(angle_rad))
		b:ScaleObject(oname, v.size, v.size, v.size)
	end    
	
    -- extra delay test
	--coroutine.yield(1)

	-- the actual loop code
	while true do
		if score > 9 then
			b:PhotoSphere_Goto("6")
		end
		if end_game then
			b:PhotoSphere_Goto("6")
		end
		for k,v in ipairs(ff) do
			oname = tostring(k)
			if v.anim < 3 then
				if v.radius < 1 then
					b:ShowMessage("The Spiders Got You!")
                    b:PlaySound("lose2")
					end_game = true
					break
				end
				angle_rad = (v.initangle+v.counter*v.speed*v.dir)*math.pi/180
				b:TweenMove(oname, v.radius*math.sin(angle_rad), v.height , v.radius*math.cos(angle_rad), 0.1)
				b:SetRotation(oname, 0, angle_rad/math.pi*180-v.dir*90+v.initialrot, 0)
				v.counter = v.counter + 1
				v.radius = v.radius - 0.01
			elseif v. anim == 3 then -- save currrent position in cangle
				v.cangle = (v.initangle+v.counter*v.speed*v.dir)*math.pi/180
				v.counter = 0
				v.anim = 4
				v.radius = 5
			elseif v.anim == 4 then -- shoot im up
				b:TweenMove(oname, v.radius*math.sin(v.cangle), v.height + v.counter*3. , v.radius*math.cos(v.cangle), 0.1)
				v.counter = v.counter + 1
				if v.counter > 5 then
					v.anim = 2
					v.counter = math.random(1000)
				end
			end
			
		end
		if end_game then
			coroutine.yield(5)
		else
			coroutine.yield(0.1)
		end
		
	end
end
