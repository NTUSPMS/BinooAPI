-- videoplayer LUA callbacks are executed when video starts or ends
b = BinooAPI

function OnVideoStart()
    b:ShowMessage("Video Started!")
end

function OnVideoEnd()
    b:ShowMessage("Video Ended!")
end

return function()
  -- mainloop
  while true do
    coroutine.yield(1)
  end
end
