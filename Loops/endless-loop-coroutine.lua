b = BinooAPI;
b:SendCommand("MESSAGE|HelloWorld!");

return function()
  local x = 0
  -- the actual loop code
  while true do
    x = x + 1
    b:CreateLine(-10,10+x,0,10,10+x,0);
    coroutine.yield(0.16)
  end
end
