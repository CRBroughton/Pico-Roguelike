function addmob(typ,mx,my)
  local m={
    x=mx,
    y=my,
    ox=0,
    oy=0,
    sox=0,
    soy=0,
    flp=false,
    mov=nil,
    ani={}
  }
  for i=0,3 do
    add(m.ani,mob_ani[typ]+i)
  end
  add(mob,m)
  return m
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