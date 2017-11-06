-- creates blue box, once its clicked, plays sounds and destroys box
b = BinooAPI

id = "bluebox"
b:CreateBox(id,1,1,1,2,2,2)
b:SetColor(id,0,0,255)
b:MoveObject(id,-5,0,-5)
b:AddBoxCollider(id, 0, 0, 0, 1,1,1)
b:AddGazeTarget(id)
b:AddEvent(id,"CLICK","MyClick",100)

b:ShowStaticMessage("Tap the box to continue")

function MyClick(sender,params)
    b:PlaySound("tadaa_trumpet")
    b:Destroy(tostring(sender))
    b:HideStaticMessage()
end
