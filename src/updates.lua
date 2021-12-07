function update_game()
  for i=0,3 do
    if btnp(i) then
      moveplayer(dirx[i+1],diry[i+1])
      return
    end
  end
end

function update_pturn()
  p_t=min(p_t+0.1,1)

  p_mov()

  if p_t==1 then
    _upd=update_game
  end
end
  
function update_gameover()
end

function mov_walk()
  p_ox=p_sox*(1-p_t)
  p_oy=p_soy*(1-p_t)
end

function mov_bump()
  local tme=p_t
  if p_t>0.5 then
    tme=1-p_t
  end
    p_ox=p_sox*tme
    p_oy=p_soy*tme
end