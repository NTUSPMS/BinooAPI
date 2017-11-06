-- find all green spheres, unhides portals after all are founded
b = BinooAPI
counter=0
maxcount=2

b:PhotoSphere_HidePortals()
b:ShowStaticMessage("Find all green spheres")

id="sphere"
b:CreateSphere(id,1,5,0,0)
b:AddGazeTarget(id);
b:AddEvent(id,"CLICK","SphereClicked","correct")
b:SetColor(id,0,255,0)

id="sphere2"
b:CreateSphere(id,1,-5,0,5)
b:AddGazeTarget(id);
b:AddEvent(id,"CLICK","SphereClicked","correct")
b:SetColor(id,0,255,0)

id="sphere3"
b:CreateSphere(id,1,0,0,5)
b:AddGazeTarget(id);
b:AddEvent(id,"CLICK","SphereClicked","wrong")
b:SetColor(id,0,0,255)

id="sphere4"
b:CreateSphere(id,1,0,0,-5)
b:AddGazeTarget(id);
b:AddEvent(id,"CLICK","SphereClicked","wrong")
b:SetColor(id,255,0,0)


function SphereClicked(sender,params)
    b:PlaySound("coin")
    if params=="correct" then
        b:RemoveGazeTarget(sender)
        b:SetColor(id,0,0,0)
        counter=counter+1
        if counter<maxcount then
          b:ShowStaticMessage("still missing "..tostring(maxcount-counter).." sphere(s)")
        else
            b:PlaySound("yay")
            b:ShowStaticMessage("Congratulations!")
            b:PhotoSphere_ShowPortals()
        end
    else
        b:PlaySound("lose2")
    end
end
