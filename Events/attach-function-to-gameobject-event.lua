-- calls functions when gameobject is clicked/gazed
b = BinooAPI;
b:CreateSphere("sphere",2,3,0,0);
b:AddGazeTarget("sphere");
b:SetLayer("sphere","UI");
b:AddEvent("sphere","CLICK","RunThisOnClick")
b:AddEvent("sphere","GAZEENTER","GazeScript")
function RunThisOnClick()
    b:Destroy("sphere");
end
function GazeScript()
    b:CreateSphere("fallingball",0,4,0,0);
    b:AddRigidbody("fallingball",1);
end
