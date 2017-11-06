-- sends message to server when button is clicked
b = BinooAPI
id = "button1"
b:CreateToggleButton(id,"1+1=3?")
b:SetPosition(id,5,0,5)
b:AddEvent(id,"CLICK","MyClick")

function MyClick(sender)
    b:ServerLog("user toggled "..tostring(sender))
    b:Destroy(tostring(sender))
    b:HideStaticMessage()
end
