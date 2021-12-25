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
    if fget(tle,0)==false then
      if mode=='checkmobs' then
        return getmob(x,y)==false
      end
      return true
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
   return false
  end
  return true
 end