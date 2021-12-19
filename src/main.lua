function _init()
  t=0
  p_ani={240,241,242,243}

  dirx={-1,1,0,0,1,1,-1,-1}
  diry={0,0,-1,1,-1,1,1,-1}

  mob_ani={240,192}
  mob_atk={1,1}
  mob_hp={5,2}

  debug={}
  startgame()
end

function _update60()
  t+=1
  _upd()
  dofloats()
end

function _draw()
  _drw()
  drawind()
  cursor(4,4)
  color(8)
  for txt in all(debug) do
    print(txt)
  end
end

function startgame()
  buttbuff=-1

  mob={}
  p_mob=addmob(1,1,1)

  for x=0,15 do
    for y=0,15 do
      if mget(x,y)==192 then
        addmob(2,x,y)
        mset(x,y,1)
      end
    end
  end


  p_t=0

  wind={}
  float={}
  talkwind=nil
  _upd=update_game
  _drw=draw_game
end