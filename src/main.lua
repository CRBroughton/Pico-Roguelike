function _init()
  t=0
  p_ani={240,241,242,243}

  dirx={-1,1,0,0}
  diry={0,0,-1,1}

  _upd=update_game
  _drw=draw_game
  startgame()
end

function _update60()
  t+=1
  _upd()
end

function _draw()
_drw()
end

function startgame()
  p_x=3
  p_y=5
  p_ox=0
  p_oy=0
  p_sox=0
  p_soy=0
  p_t=0
end