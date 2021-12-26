function moveplayer(dx,dy)
	local destx,desty=p_mob.x+dx,p_mob.y+dy
	local tle=mget(destx,desty)

	if iswalkable(destx,desty,'checkmobs') then
		sfx(63)
    mobwalk(p_mob,dx,dy)
    p_t=0
   _upd=update_pturn
	else
		--not walkable
    mobbump(p_mob,dx,dy)
    p_t=0
    _upd=update_pturn

    local mob=getmob(destx,desty)
    if mob==false then
      if fget(tle,1) then
        trig_bump(tle,destx,desty)
      end
    else
      sfx(58)
      hitmob(p_mob,mob)
    end
	end
  unfog()
end

function trig_bump(tle,destx,desty)
	if tle==7 or tle==8 then
		-- vase
		sfx(59)
		mset(destx,desty,1)
	elseif tle==10 or tle==12 then
		-- chest
		sfx(61)
		mset(destx,desty,tle-1)
	elseif tle==13 then
		-- door
		sfx(62)
		mset(destx,desty,1)
	elseif tle==6 then
		-- stone tablet
		-- showmsg('hello world', 120)
		if destx==2 and desty==5 then
			showmsg({"welcome to porklike","","climb the tower","to obtain the","golden kielbasa"})
		   elseif destx==13 and desty==12 then
			showmsg({"this is the 2nd message"})
		   elseif destx==13 and desty==6 then
			showmsg({"you're almost there!"})
		end
		-- addwind(32,64,64,24,{'welcome to the world','of porklike'})
	end
end

function getmob(x,y)
  for m in all(mob) do
    if m.x==x and m.y==y then
      return m
    end
  end
  return false
end

function iswalkable(x,y,mode)
  if mode==nil then mode='' end
	if inbounds(x,y) then
	  local tle=mget(x,y)
    if mode=="sight" then
      return not fget(tle,2)
    else
      if fget(tle,0)==false then
        if mode=="checkmobs" then
          return getmob(x,y)==false
        end
        return true
      end
    end
  end
  return false
end

function inbounds(x,y)
  return not (x<0 or y<0 or x>15 or y>15)
end

function hitmob(atkm,defm)
  local dmg=atkm.atk
  defm.hp-=dmg
  defm.flash=10

  addfloat('-'..dmg,defm.x*8,defm.y*8,9)

  if defm.hp<=0 then
    -- hp is zero
    add(dmob,defm)
    del(mob,defm)
    defm.dur=10
  end
end

function checkend()
  if p_mob.hp<=0 then
    wind={}
   _upd=update_gover
   _drw=draw_gover
   fadeout(0.02)
   reload(0x2000,0x2000,0x1000)
   return false
  end
  return true
 end

function los(x1,y1,x2,y2)
  local frst,sx,sy,dx,dy=true
  --★
  if dist(x1,y1,x2,y2)==1 then return true end
  if x1<x2 then
   sx=1
   dx=x2-x1
  else
   sx=-1
   dx=x1-x2
  end
  if y1<y2 then
   sy=1
   dy=y2-y1
  else
   sy=-1
   dy=y1-y2
  end
  local err, e2 = dx-dy, nil
  
  while not(x1==x2 and y1==y2) do
   if not frst and iswalkable(x1,y1,"sight")==false then return false end
   frst=false
   e2=err+err
   if e2>-dy then
    err=err-dy
    x1=x1+sx
   end
   if e2<dx then
    err=err+dx
    y1=y1+sy
   end
  end
  return true 
end

function unfog()
  local px,py=p_mob.x,p_mob.y
  for x=0,15 do
    for y=0,15 do
      if  dist(px,py,x,y)<=p_mob.los and los(px,py,x,y) then
        unfogtile(x,y)
      end
    end
  end
end

function unfogtile(x,y)
  fog[x][y]=0
  if iswalkable(x,y,"sight") then
    for i=1,4 do
      local tx,ty=x+dirx[i],y+diry[i]
      if inbounds(tx,ty) and not iswalkable(tx,ty,"sight") then
        fog[tx][ty]=0
      end
    end
  end
end