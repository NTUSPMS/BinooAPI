-- creates worldspace button, sets button text, adds click event to button
b = BinooAPI
id = "button"
b:CreateButton(id,"Click!")
b:SetPosition(id,5,0,5)
b:AddEvent(id,"CLICK","MyClick")

function MyClick(sender)
    b:SendCommand("MESSAGE|clicked "..tostring(sender).." with param "..tostring(param))
    b:RemoveGazeTarget(tostring(sender))
    b:SetButtonText(tostring(sender),"Done!")
end
