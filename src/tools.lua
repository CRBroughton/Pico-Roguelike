
  -- t continues to advance through the array, fast
  -- to limit the speed it advances through the frames
  -- we divide t by a number, in this case 16 (this number
  -- can be used to control the animation speed)

  -- by using the flr(floor) command, we strip away
  -- anything past the full number, removing the float
  -- now we have 0,0,1,1,2,2 etc

  -- we then modulate by 4, and now have
  -- 0,0,1,1,2,2,3,3,0,0 etc, repeating

  -- finally we +1 to match lua arrays starting at 1
  
function getframe(ani)
  return ani[flr(t/16)%#ani+1]
end

function drawspr(_spr, _x, _y, _c)
  palt(0,false)
  pal(6,_c)
  spr(_spr, _x, _y)
  pal()
end