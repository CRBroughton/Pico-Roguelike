function addwind(_x,_y,_w,_h,_txt)
  local w={x=_x,
           y=_y,
           w=_w,
           h=_h,
           txt=_txt
          }
  add(wind,w)
  return w
end

function drawind()
  for w in all(wind) do
    local wx,wy,ww,wh=w.x,w.y,w.w,w.h
    rectfill2(wx,wy,ww,wh,0)
    rect(wx+1,wy+1,wx+ww-2,wy+wh-2,6)
    wx+=4
    wy+=4
    clip(wx,wy,ww-8,wh-8)
    for i=1,#w.txt do
      local txt=w.txt[i]
      print(txt,wx,wy,6)
      wy+=6
    end

    clip()

    if w.dur!=nil then
      w.dur-=1
      if w.dur<3 then
        local dif=wh/4
        w.y+=dif/2
        w.h-=dif
        if dif<1 then
          del(wind,w)
        end
      end
    else
      if w.butt then
        oprint8('❎',wx+ww-15,wy-1+sin(time()),6,0)
      end
    end
  end
end

function showmsg(txt,dur)
  local wid=(#txt+2)*4+7
  local w=addwind(63-wid/2,50,wid,13,{' '..txt})
  w.dur=dur
end

function showmsg(txt)
  talkwind=addwind(16,50,94,#txt*6+7,txt)
  talkwind.butt=true
end

function addfloat(_txt,_x,_y,_c)
  add(float,{txt=_txt,x=_x,y=_y,c=_c,ty=_y-10,t=0})
end

function dofloats()
  for f in all(float) do
    f.y+=(f.ty-f.y)/10
    f.t+=1
    if f.t>70 then
      del(float,f)
    end
  end
end