-- add button to open live stream from channel
-- with exit and failed events to show button again 
b=BinooAPI

channelID = "UCgWjWtHM0Bfq4KJNvRp8bEw" -- edu2vr

id = "button"

b:ShowMessage("Click View Stream-to start!")

b:CreateButton(id,"View Stream")
b:SetPosition(id,-7,0.5,5)
b:AddEvent(id,"CLICK","MyClick")

function MyClick(sender)
    b:PlayYoutubeChannelStream360(channelID)
    b:SetActive(id,false)
end

function OnVideoFailed()
    b:SetActive(id,true)
end

function OnVideoExit()
    b:SetActive(id,true)
end
