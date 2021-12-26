function addmob(typ,mx,my)
  local m={
    x=mx,
    y=my,
    ox=0,
    oy=0,
    flp=false,
    ani={},
    flash=0,
    hp=mob_hp[typ],
    hpmax=mob_hp[typ],
    atk=mob_atk[typ],
    los=mob_los[typ],
    task=ai_wait,
  }
  for i=0,3 do
    add(m.ani,mob_ani[typ]+i)
  end
  add(mob,m)
  return m
end

function mobwalk(mb,dx,dy)
  mb.x+=dx
  mb.y+=dy

  mobflip(mb,dx)
  mb.sox,mb.soy=-dx*8,-dy*8
  mb.ox,mb.oy=mb.sox,mb.soy

  mb.mov=mov_walk
end

function mobbump(mb,dx,dy)
  mobflip(mb,dx)
  mb.sox,mb.soy=dx*8,dy*8
  mb.ox,mb.oy=0,0
  mb.mov=mov_bump
end

function mobflip(mb,dx)
  if dx<0 then
		mb.flp=true
	elseif dx>0 then
		mb.flp=false
	end
end

function mov_walk(mb,at)
  mb.ox=mb.sox*(1-at)
  mb.oy=mb.soy*(1-at)
end

function mov_bump(mb,at)
  local tme=at
  if at>0.5 then
    tme=1-at
  end
    mb.ox=mb.sox*tme
    mb.oy=mb.soy*tme
end

function doai()
  local moving=false
  for m in all(mob) do
    if m !=p_mob then
      m.mov=nil
      moving=m.task(m) or moving
    end
  end
  if moving then
    _upd=update_aiturn
    p_t=0
  end
end

function ai_wait(m)
  if cansee(m,p_mob) then
    --aggro
    m.task=ai_attac
    m.tx,m.ty=p_mob.x,p_mob.y
    addfloat('!',m.x*8+2,m.y*8,10)
    return true
  end
  return false
end

function ai_attac(m)
  if dist(m.x,m.y,p_mob.x,p_mob.y)==1 then
    --attack player
    local dx,dy=p_mob.x-m.x,p_mob.y-m.y
    mobbump(m,dx,dy)
    hitmob(m,p_mob)
    sfx(57)
    return true
  else
      --move towards player
    if cansee(m,p_mob) then
      m.tx,m.ty=p_mob.x,p_mob.y
    end

    if m.x==m.tx and m.y==m.ty then
      --de_aggro
      m.task=ai_wait
      addfloat('?',m.x*8+2,m.y*8,10)
    else
      local bdst,bx,by=999,0,0
      for i=1,4 do
        local dx,dy=dirx[i],diry[i]
        local tx,ty=m.x+dx,m.y+dy
        if iswalkable(tx,ty,"checkmobs") then
          local dst=dist(tx,ty,m.tx,m.ty)
          if dst<bdst then
            bdst,bx,by=dst,dx,dy
          end
        end
      end
      mobwalk(m,bx,by)
      return true
      -- smarter ai
      -- if los(m.x,m.y,p_mob.x,p_mob.y) then
      --   m.tx,m.ty=p_mob.x,p_mob.y
      -- end
    end
  end
  return false
end

function cansee(m1,m2)
  return dist(m1.x,m1.y,m2.x,m2.y)<=m1.los and los(m1.x,m1.y,m2.x,m2.y)
end