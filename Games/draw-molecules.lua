b=BinooAPI

b:DebugMode(true)

--[[ Water
--atoms of the molecule
a={}
a[1]={x=-0.2309, y=-0.3265, z=0.0000, kind="O"}
a[2]={x= 0.7484, y=-0.2843, z=0.0000, kind="H"}
a[3]={x=-0.5175, y= 0.6108, z=0.0000, kind="H"}
--bonds or vertices
v={}
v[1]={1,2}
v[2]={1,3}
--]]


--ASPRIN data below
a={}
a[1]={x=  -0.8612,y=   -1.2262,z=   -0.2662 , kind="O"}
a[2]={x=    3.0617,y=   -1.6852,z=    0.1961 , kind="O"} 
a[3]={x=    1.4447,y=   -2.5635,z=   -0.6900 , kind="O"} 
a[4]={x=   -2.4189,y=  -2.5903,z=   -0.0729 , kind="O"}
a[5]={x=   -0.1412,y=   -0.1785,z=   -0.4132 , kind="C"}
a[6]={x=    1.2784,y=   -0.2956,z=   -0.3433 , kind="C"}
a[7]={x=   -0.7302,y=    1.0925,z=   -0.6232 , kind="C"}
a[8]={x=    2.0415,y=    0.9020,z=   -0.3420 , kind="C"}
a[9]={x=    0.0491,y=    2.2590,z=   -0.6408 , kind="C"}
a[10]={x=    1.4378,y=    2.1648,z=   -0.4724 , kind="C"} 
a[11]={x=    1.9369,y=   -1.5271,z=   -0.2701 , kind="C"}
a[12]={x=   -1.9700,y=   -1.4955,z=    0.2325 , kind="C"}
a[13]={x=   -2.7371,y=   -0.6848,z=    1.1595 , kind="C"}
a[14]={x=   -1.7396,y=    1.1850,z=   -0.7587 , kind="H"}
a[15]={x=    3.0610,y=    0.8861,z=   -0.2532 , kind="H"}
a[16]={x=   -0.3946,y=    3.1715,z=   -0.7684 , kind="H"}
a[17]={x=    2.0064,y=    3.0149,z=   -0.4552 , kind="H"}
a[18]={x=   -3.0283,y=   -1.2693,z=    2.0341 , kind="H"}
a[19]={x=   -3.6371,y=   -0.3138,z=    0.6664 , kind="H"}
a[20]={x=   -2.1731,y=    0.1707,z=    1.5341 , kind="H"}
a[21]={x=    3.5136,y=   -1.0170,z=    0.5467 , kind="H"}

--bonds
v={}
v[1]={  1,  5,  1 }
v[2]={  1, 12,  1}
v[3]={  2, 11,  1 }
v[4]={  2, 21,  1 }
v[5]={  3, 11,  2 }
v[6]={  4, 12,  2 }
v[7]={  5,  6,  1 }
v[8]={  5,  7,  2 }
v[9]={  6,  8,  2 }
v[10]={  6, 11,  1 }
v[11]={  7,  9,  1 }
v[12]={  7, 14,  1 }
v[13]={  8, 10,  1 }
v[14]={  8, 15,  1 }
v[15]={  9, 10,  2 }
v[16]={  9, 16,  1 }
v[17]={  10, 17,  1 }
v[18]={  12, 13,  1 }
v[19]={   13, 18,  1 }
v[20]={  13, 19, 1  }
v[21]={  13, 20,  1  }

b:SendCommand("MESSAGE|Asprin")

--color of atoms {r,g,b}
c={}
c["O"]={255,0,0}
c["H"]={230,230,230}
c["C"]={10,10,10}

--sizes of atoms 
s={}
s["H"]=0.058
s["C"]=0.070
s["O"]=0.06

--name of atomes
atom_name={}
atom_name["H"]="Hydrogen"
atom_name["C"]="Carbon"
atom_name["O"]="Oxygen"


scale=1.0
radius=10
rotation=false


--calculate the center of mass of the molecule
function calc_COM(my_molecule)
    local comx=0
    local comy=0
    local comz=0
    for key,atom in ipairs(my_molecule) do
        comx = comx + atom.x
        comy = comy + atom.y
        comz = comz + atom.z
    end
    comx = comx / #my_molecule
    comy = comy / #my_molecule
    comz = comz / #my_molecule
    return {comx, comy, comz}
end

function center_molecule(my_molecule)
    local com=calc_COM(my_molecule)
    for key, atom in ipairs(my_molecule) do
        my_molecule[key].x = atom.x-com[1]
        my_molecule[key].y = atom.y-com[2]
        my_molecule[key].z = atom.z-com[3]
    end
    return my_molecule
end

--[[rotate a molecule ah with bonds vh in 
rotr degrees along y axis and rotr in r direction
ui boolean if ui should be displayed
--]]
function molecule(rotr,roty,ah,vh,ui)
    
    local cp = {radius*math.sin(math.pi*rotr/180),0,radius*math.cos(math.pi*rotr/180)}
    local pos = {}
    local ya = math.pi*roty/180
        
    for key,atom in ipairs(ah) do
        pos[key] = {cp[1]-scale*(math.cos(ya)*atom.x + math.sin(ya)*atom.z),
            cp[2]-atom.y*scale,
            cp[3]-scale*(-math.sin(ya)*atom.x + math.cos(ya)*atom.z)}
    end

    for key,atom in ipairs(ah) do
        b:CreateSphere(tostring(key),s[atom.kind]*14*scale,pos[key][1],pos[key][2],pos[key][3])
        b:SetColor(tostring(key),c[atom.kind][1],c[atom.kind][2],c[atom.kind][3])
        --b:AddGazeTarget(tostring(key))
        b:AddEvent(tostring(key),"GAZEENTER","GazeAtom")
    end

    for key,bond in ipairs(vh) do
        b:CreateLine("name",pos[bond[1]][1],pos[bond[1]][2],pos[bond[1]][3],
            pos[bond[2]][1],pos[bond[2]][2],pos[bond[2]][3])
    end
    
    if ui == true then
            b:CreateCube("StartButton", 1, 1, 1, cp[1], -10, cp[3])
            b:SetColor("StartButton", 15, 230, 30)
            b:AddGazeTarget("StartButton")
            b:AddEvent("StartButton","GAZEENTER","Start")
            b:CreateCube("StopButton", 1, 1, 1, cp[1]-1, -10, cp[3])
            b:SetColor("StopButton", 230, 15, 30)
            b:AddGazeTarget("StopButton")
            b:AddEvent("StopButton","GAZEENTER","Stop")
    end

end

function GazeAtom(name)
    if rotation==false then
        pos=tonumber(name)
        b:SendCommand("MESSAGE|" .. atom_name[a[pos].kind])
    end
end

function GazeO()
    if rotation==false then 
        b:SendCommand("MESSAGE|Oxygen")
    end
end

function GazeH()
    if rotation==false then 
        b:SendCommand("MESSAGE|Hydrogen")
    end
end

function GazeC()
    if rotation==false then 
        b:SendCommand("MESSAGE|Carbon")
    end
end

function Start()
    rotation = true
end

function Stop()
    rotation = false
end



-- make sure the center of mass is at (0,0,0)
a=center_molecule(a)
-- display the molecules with ui
molecule(0,0,a,v,true)

return function()
  local x = 0
  -- the actual loop code
  while true do
    if rotation then
        x = x + .5
        b:ClearObjects()
        molecule(0,5*x,a,v,true)
    end
    coroutine.yield(0.1)
  end
end
