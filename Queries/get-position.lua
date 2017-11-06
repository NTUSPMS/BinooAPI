b = BinooAPI
b:CreateCube("box",1,1,1,3,0,0)
-- return vector3 as a comma separated string x,y,z
b:Log(b:GetPosition("box"))
