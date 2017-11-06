-- displays static message at bottom, hides it on button click
b = BinooAPI
id = "button"
b:CreateButton(id,"Click!")
b:SetPosition(id,5,0,5)
b:AddEvent(id,"CLICK","MyClick")
b:ShowStaticMessage("Instructions here!")

function MyClick(sender)
    b:Destroy(tostring(sender))
    b:HideStaticMessage()
end
