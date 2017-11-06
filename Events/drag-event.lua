-- creates box, that can be dragged, calls given functions on drag start and on release
b = BinooAPI
id="box"
b:CreateBox(id, 1,1,1, 2,2,2)
b:AddBoxCollider(id, 0, 0, 0, 1,1,1)
b:MoveObject(id,5,0,0)
b:AddDragTarget(id,"DragStart", "DragEnd")

function DragStart()
    b:ShowMessage("Drag Started!")
    b:ShowStaticMessage("Move this object somewhere..")
end

function DragEnd()
    b:ShowMessage("Drag Ended!")
    b:HideStaticMessage()
end
