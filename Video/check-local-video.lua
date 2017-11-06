b = BinooAPI
b:SwitchMode("EMPTY")

-- check if this file exists in 'sdcard/binoo/' folder
localFile = "video.mp4"

if b:VideoExistsSDCard(localFile) then
    b:PlayLocalVideo2D(localFile)
else -- play youtube if no local video
    b:PlayVideoYoutube2D("OsgcuZkCQv0")
end
