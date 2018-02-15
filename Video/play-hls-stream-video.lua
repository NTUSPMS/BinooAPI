-- play 2D or 360 HTTP HLS Stream videos
b=BinooAPI

-- 2D videoplayer
--url = "http://cdn-fms.rbs.com.br/vod/hls_sample1_manifest.m3u8"
--b:PlayURLVideo2D(url)

-- 360 video player
url = "https://bitmovin-a.akamaihd.net/content/playhouse-vr/m3u8s/105560.m3u8"
b:PlayURLVideo360(url)
