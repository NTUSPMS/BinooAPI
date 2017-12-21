-- example of setting/getting persistant data from server
b = BinooAPI

id = "button"
b:CreateButton(id,"Click!")
b:SetPosition(id,-5,0,1)
b:AddEvent(id,"CLICK","MyClick","mykey")

function MyClick(sender, param)
    -- query button data first
    b:DataGet(param,"DataCallBack")
end

-- this is called after receiving reply from server to DataGet() query
function DataCallBack(key,data)
    b:Log("key:"..tostring(key))
    b:Log("data:"..tostring(data))
    -- set server data value
--    b:DataSet(param,"1","DataCallBack")
end

return function()
  while true do
    coroutine.yield(0.16)
  end
end
