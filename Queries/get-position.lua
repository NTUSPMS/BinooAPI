b = BinooAPI
b:CreateCube("box",1,1,1,3,0,0)
-- returns float[] array x,y,z
p = b:GetPosition("box")
b:Log(p[0]) --x
b:Log(p[1]) --y
b:Log(p[2]) --z
