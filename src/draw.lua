function draw_game()
  cls(0)
  map()
  -- drawspr(getframe(p_ani),p_x*8+p_ox, p_y*8+p_oy, 10,p_flip)
  for m in all(dmob) do
    local col=10
    if m.flash>0 then
      m.flash-=1
      col=7
    end
    m.dur-=1
    drawspr(getframe(m.ani),m.x*8+m.ox,m.y*8+m.oy,col,m.flp)
    if m.dur<=0 then
      del(dmob.m)
    end
  end


  for m in all(mob) do
    local col=10
    if m.flash>0 then
      m.flash-=1
      col=7
    end
    drawspr(getframe(m.ani),m.x*8+m.ox,m.y*8+m.oy,col,m.flp)
  end
  for f in all(float) do
    oprint8(f.txt,f.x,f.y,f.c,0)
  end
end
  
function draw_gover()
 cls(2)
 print("y ded",50,50,7)
 
end