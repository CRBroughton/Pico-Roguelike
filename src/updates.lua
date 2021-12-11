function update_game()
  if talkwind then
    if getbutt()==5 then
      talkwind.dur=0
      talkwind=nil
    end
  else
    dobuttbuff()
    dobutt(buttbuff)
    buttbuff=-1
  end
end

function update_pturn()
  dobuttbuff()
  p_t=min(p_t+0.1,1)

  p_mob.mov(p_mob,p_t)

  if p_t==1 then
    _upd=update_game
  end
end
  
function update_gameover()
end

function mov_walk(mob,at)
  mob.ox=mob.sox*(1-at)
  mob.oy=mob.soy*(1-at)
end

function mov_bump(mob,at)
  local tme=at
  if at>0.5 then
    tme=1-at
  end
    mob.ox=mob.sox*tme
    mob.oy=mob.soy*tme
end

function dobuttbuff()
  if buttbuff==-1 then
    buttbuff=getbutt()
  end
end

function getbutt()
  for i=0,5 do
    if btnp(i) then
      return i
    end
  end
  return -1
end

function dobutt(butt)
  if butt<0 then 
    return
  end
  if butt<4 then
    moveplayer(dirx[butt+1],diry[butt+1])
  end
    -- menu button
end