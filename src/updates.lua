function update_game()
  if btnp(0) then
    p_x-=1
  end
  if btnp(1) then
    p_x+=1
  end
  if btnp(2) then
    p_y-=1
  end
  if btnp(3) then
    p_y+=1
  end
end
  
function update_gameover()
end