/-  pokedex
/+  default-agent, dbug
|%
+$  versioned-state
  $%  state-0
  ==
+$  state-0  [%0 =mons:pokedex]
+$  card  card:agent:gall
--
%-  agent:dbug
=|  state-0
=*  state  -
^-  agent:gall
|_  =bowl:gall
+*  this  .
    def   ~(. (default-agent this %.n) bowl)
::
++  on-init   on-init:def
++  on-save   !>(state)
++  on-load
  |=  old=vase
  ^-  (quip card _this)
  `this(state !<(state-0 old))
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  |^
  ?>  =(src.bowl our.bowl)
  ?+    mark  (on-poke:def mark vase)
      %pokedex-action
    =^  cards  state
      (handle-poke !<(action:pokedex vase))
    [cards this]
  ==
  ++  handle-poke
    |=  =action:pokedex
    ^-  (quip card _state)
    ?+    -.action  !!
         %lookup     :: if its %lookup....
       ?:  (~(has by mons) mon.action)
         :: we have this mon.
         :: return it!
         ~&  'mon have'
         :_  state
         :~  :*  %give  %fact  ~[/updates]  %pokedex-update
                 !>(`update:pokedex`[%lookup (~(got by mons) mon.action)])
             ==
         ==
       ~&  'mon no have'
       :_  state(mons (~(put by mons) mon.action 'test'))
       :~  :*  %give  %fact  ~[/updates]  %pokedex-update
               !>(`update:pokedex`[%lookup (~(got by mons) mon.action)])
           ==
       ==
     ==
  --
  ::
  :: ?>  ?=(%pokedex-action mark)
  :: =/  act  !<(action vase)
  :: ?-    -.act
  ::     %lookup
  ::     ~&  'got lookup'
  ::     :_  this
  ::     [%pass /pokes %agent [mon.act %pokedex] %poke mark vase]~
  ::
++  on-peek  on-peek:def
++  on-watch  on-watch:def
  :: |=  =path
  :: ^-  (quip card _this)
  :: ?>  ?=([%values ~] path)
  :: :_  this
  :: [%give %fact ~ %delta-update !>(`update`[%init values])]~
  :: TODO: give an update fact to lookup
++  on-arvo   on-arvo:def
++  on-leave  on-leave:def
++  on-agent  on-agent:def
   :: |=  [=wire =sign:agent:gall]
   :: ^-  (quip card _this)
   :: ?+    -.wire  (on-agent:def wire sign)
   ::     %thread
   ::   ?+    -.sign  (on-agent:def wire sign)
   ::       %poke-ack
   ::     ?~  p.sign
   ::       %-  (slog leaf+"Thread started successfully" ~)
   ::       `this
   ::     %-  (slog leaf+"Thread failed to start" u.p.sign)
   ::     `this
   ::   ==
   :: ==
++  on-fail   on-fail:def
--
