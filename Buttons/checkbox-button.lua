-- creates worldspace button with checkbox, adds click event to button, shows sticky message
b = BinooAPI
id = "button"
b:CreateToggleButton(id,"Toggle me!")
b:SetPosition(id,5,0,5)
b:AddEvent(id,"CLICK","MyClick")
b:ShowStaticMessage("Select something..")

function MyClick(sender)
    b:Destroy(tostring(sender))
    b:HideStaticMessage()
end
