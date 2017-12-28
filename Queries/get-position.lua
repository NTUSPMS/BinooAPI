b = BinooAPI
b:CreateCube("box",1,1,1,3,0,0)
-- returns float[] array x,y,z
p = b:GetPosition("box")
-- NOTE: LUA array starts from 1
b:Log(p[1]) --x
b:Log(p[2]) --y
b:Log(p[3]) --z
