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