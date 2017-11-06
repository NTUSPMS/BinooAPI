-- creates texture and assigns to object
b = BinooAPI
b:SendCommand("MESSAGE|HelloWorld!")
b:CreateSphere("box",1,3,0,0)
b:CreateTexture("tex1",128,128)
b:ClearTexture("tex1",255,0,0)
b:AssignTexture("box","tex1")
