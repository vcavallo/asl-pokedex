/-  pokedex
|_  =action:pokedex
++  grow
  |%
  ++  noun  action:pokedex
  --
++  grab
  |%
  ++  noun  action
  :: ++  json
  ::   =,  dejs:format
  ::   |=  jon=json
  ::   ^-  action
  ::   %.  jon
  ::   %-  of
  ::   :~  [%push (ot ~[target+(se %p) value+ni])]
  ::       [%pop (se %p)]
  ::   ==
  :: --
++  grad  %noun
--
