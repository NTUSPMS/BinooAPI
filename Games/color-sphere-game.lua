b = BinooAPI
b:CreateSphere("red",1,-3,0,0)
b:SetColor("red",255,0,0)
b:AddGazeTarget("red")
b:AddEvent("red","CLICK","ClickCorrect")

b:CreateSphere("green",1,-3,-1,0)
b:SetColor("green",0,255,0)
b:AddGazeTarget("green")
b:AddEvent("green","CLICK","ClickWrongGreen")

b:CreateSphere("blue",1,-3,-2,0)
b:SetColor("blue",0,0,255)
b:AddGazeTarget("blue")
b:AddEvent("blue","CLICK","ClickWrongBlue")

b:SendCommand("MESSAGE|Select red sphere!")

function ClickCorrect()
    b:SendCommand("MESSAGE|Thats correct!")
    b:SendCommand("GOPHOTOSPHERE|51")
    b:ClearObjects()
    b:SendCommand("RAWSCRIPT|https://gist.githubusercontent.com/unitycoder/fb403925c1759d19e17d40fffa0ec7a2/raw/65db9cae0a800d6ebc6900a0fba2fd447ef98f75/luatest2.lua")
end

function ClickWrongBlue()
    b:SendCommand("MESSAGE|Wrong Answer!")
    b:SendCommand("AUDIO|http://soundbible.com/grab.php?id=1830&type=mp3")
    b:Destroy("blue");
end

function ClickWrongGreen()
    b:SendCommand("MESSAGE|Wrong Answer!")
    b:SendCommand("AUDIO|http://soundbible.com/grab.php?id=1830&type=mp3")
    b:Destroy("green");
end
