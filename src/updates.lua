function update_game()
  if btnp(0) then
    p_x-=1
    p_ox=8
    _upd=update_pturn
  end
  if btnp(1) then
    p_x+=1
    p_ox=-8
    _upd=update_pturn
  end
  if btnp(2) then
    p_y-=1
    p_oy=8
    _upd=update_pturn
  end
  if btnp(3) then
    p_y+=1
    p_oy=-8
    _upd=update_pturn
  end
end

function update_pturn()
  if p_ox >0 then
    p_ox-=1
  end
  if p_ox <0 then
    p_ox+=1
  end
  if p_oy >0 then
    p_oy-=1
  end
  if p_oy <0 then
    p_oy+=1
  end
  if p_ox==0 and p_oy==0 then
    _upd=update_game
  end
end
  
function update_gameover()
end