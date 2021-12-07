function update_game()
  for i=0,3 do
    if btnp(i) then
      local dx,dy=dirx[i+1],diry[i+1]
      p_x+=dx
      p_y+=dy

      if dx<0 then
        p_flip=true
      elseif dx>0 then
        p_flip=false
      end
      
      p_sox,p_soy=-dx*8,-dy*8
      p_ox,p_oy=p_sox,p_soy
      p_t=0
      _upd=update_pturn
      return
    end
  end
end

function update_pturn()
  p_t=min(p_t+0.1,1)

  p_ox=p_sox*(1-p_t)
  p_oy=p_soy*(1-p_t)

  if p_t==1 then
    _upd=update_game
  end
end
  
function update_gameover()
end