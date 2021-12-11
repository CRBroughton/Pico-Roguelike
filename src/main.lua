function _init()
  t=0
  p_ani={240,241,242,243}

  dirx={-1,1,0,0,1,1,-1,-1}
  diry={0,0,-1,1,-1,1,1,-1}

  mob_ani={240,192}

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
  drawind()
end

function startgame()
  buttbuff=-1

  mob={}
  p_mob=addmob(1,1,1)
  addmob(2,2,3)

  p_t=0

  wind={}
  talkwind=nil
end