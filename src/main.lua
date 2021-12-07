function _init()
  _upd=update_game
  _drw=draw_game
  startgame()
end

function _update()
  _upd()
end

function _draw()
_drw()
end

function startgame()
  p_x=3
  p_y=5
end