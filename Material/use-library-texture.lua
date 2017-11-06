-- create box, set library texture to it
b = BinooAPI
id="box"
b:CreateBox(id, 1,1,1, 2,2,2)
b:MoveObject(id,5,0,0)
b:AssignLibraryTexture(id,"marble")
