-- not working
b = BinooAPI

id="box"
b:CreateSphere(id, 3, 8)
b:SetPosition(id,1,2,3)
pos = b:GetPosition(id)
b:Log(pos)

-- broken
arr = b:Split(pos,',')
b:Log(arr)
