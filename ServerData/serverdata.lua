-- example of setting/getting persistant data from server
b = BinooAPI

id = "button"
b:CreateButton(id,"Click!")
b:SetPosition(id,-5,0,2)
b:AddEvent(id,"CLICK","MyClick","mykey")

function MyClick(sender, param)
    -- query button data first
    b:GetData(param,"DataCallBack")
    -- could play some animation or effect so that user waits for server reply
end

-- this is called after receiving reply from server to DataGet() query
function DataCallBack(key,data)
    -- if no data, nobody has set it yet
    if (data==nil) then
        b:ShowMessage("Congratulations, you were the first one!")
        -- save my username for this key data
        b:SetData(key,b:GetUserName())
    else -- had some data value for this key already
        b:ShowMessage(data.." already founded this box..")
    end
end


return function()
  -- mainloop
  while true do
    coroutine.yield(0.16)
  end
end
