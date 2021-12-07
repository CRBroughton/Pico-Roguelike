function addwind(_x,_y,_w,_h,_txt)
  local w={x=_x,
           y=_y,
           w=_w,
           h=_h,
           txt=_txt
          }
  add(wind,w)
  return w
end