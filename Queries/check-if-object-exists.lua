b = BinooAPI

-- uncomment next line to see founded msg
--b:CreateSphere("sphere2",1,3,0,0)

-- GetObject() returns true or false
if  b:FindObject("sphere2") then
    b:SendCommand("MESSAGE|Object Founded!")
else
    b:SendCommand("MESSAGE|Not founded..")
end
