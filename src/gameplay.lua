function moveplayer(dx,dy)
	local destx,desty=p_mob.x+dx,p_mob.y+dy
	local tle=mget(destx,desty)

	if dx<0 then
		p_mob.flp=true
	elseif dx>0 then
		p_mob.flp=false
	end

	if fget(tle,0) then
		--a wall is here
		p_mob.sox,p_mob.soy=dx*8,dy*8
		p_mob.ox,p_mob.oy=0,0
		p_t=0
		_upd=update_pturn
		p_mob.mov=mov_bump
		if fget(tle,1) then
			trig_bump(tle,destx,desty)
		end
	else
		sfx(63)
		p_mob.x+=dx
		p_mob.y+=dy

		p_mob.sox,p_mob.soy=-dx*8,-dy*8
		p_mob.ox,p_mob.oy=p_mob.sox,p_mob.soy
		p_t=0
		_upd=update_pturn
		p_mob.mov=mov_walk
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