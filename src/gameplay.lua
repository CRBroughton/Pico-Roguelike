function moveplayer(dx,dy)
	local destx,desty=p_x+dx,p_y+dy
	local tle=mget(destx,desty)

	if dx<0 then
		p_flip=true
	elseif dx>0 then
		p_flip=false
	end

	if fget(tle,0) then
		--a wall is here
		p_sox,p_soy=dx*8,dy*8
		p_ox,p_oy=0,0
		p_t=0
		_upd=update_pturn
		p_mov=mov_bump
		if fget(tle,1) then
			trig_bump(tle,destx,desty)
		end
	else
		p_x+=dx
		p_y+=dy

		p_sox,p_soy=-dx*8,-dy*8
		p_ox,p_oy=p_sox,p_soy
		p_t=0
		_upd=update_pturn
		p_mov=mov_walk
	end
end

function trig_bump(tle,destx,desty)
	if tle==7 or tle==8 then
		-- vase
		mset(destx,desty,1)
	elseif tle==10 or tle==12 then
		-- chest
		mset(destx,desty,tle-1)
	elseif tle==13 then
		-- door
		mset(destx,desty,1)
	end
end