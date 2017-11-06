-- play local or youtube video in 2D plane
b = BinooAPI
b:SwitchMode("EMPTY")
-- play local video in 2D viewer
-- for android requires /sdcard/binoo/video.mp4
-- for pc requires d:/data/binoo/video.mp4
-- b:PlayLocalVideo2D("video.mp4")

-- play youtube in 2D viewer
b:PlayVideoYoutube2D("OsgcuZkCQv0")
