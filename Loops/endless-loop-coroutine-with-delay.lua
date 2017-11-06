-- delay variable in coroutine only works in v2.34 or later
b = BinooAPI
b:SendCommand("MESSAGE|HelloWorld!")

return function()
  local x = 0
  while true do
    x = x + 1
    b:CreateLine(-10,10+x,0,10,10+x,0);
    -- wait 7 seconds
    coroutine.yield(7)
    x = x + 1
    b:CreateLine(-20,10+x,0,20,10+x,0);
    -- wait 1 second
    coroutine.yield(1)
  end
end
