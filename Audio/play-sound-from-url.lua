b = BinooAPI
id = "button"
b:CreateButton(id,"Sound1")
b:SetPosition(id,5,0,5)
b:AddEvent(id,"CLICK","PlayAudio","https://binoo.edu2vr.com/public/audio/129/1516160707405-cybernoid.mp3")
isplaying = false

function PlayAudio(sender,param)
    if isplaying==true then
        b:StopAllSounds()
        isplaying=false
    else
        b:PlaySoundFromURL(param)
        isplaying=true
    end
end
