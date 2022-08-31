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
  ++  get-mon
    |=  =mon:pokedex
    ^-  (quip card _state)
    :: =/  result  -pokedex  mon.action
    =/  tid  `@ta`(cat 3 'thread_' (scot %uv (sham eny.bowl)))
    =/  ta-now  `@ta`(scot %da now.bowl)
    =/  start-args  [~ `tid byk.bowl(r da+now.bowl) %pokedex !>(`mon)]
    :_  state
    :~
      [%pass /thread-res/[mon]/[ta-now] %agent [our.bowl %spider] %watch /thread-result/[tid]]
      [%pass /thread-res/[mon]/[ta-now] %agent [our.bowl %spider] %poke %spider-start !>(start-args)]
    ==
  ++  handle-poke
    |=  =action:pokedex
    ^-  (quip card _state)
    ?+    -.action  !!
         %lookup
       ?:  (~(has by mons) mon.action)
         :: we have this mon. return it!
         ~&  'mon hav'
         ~&  (~(got by mons) mon.action)
         :_  state
         :~  :*  %give  %fact  ~[/updates]  %pokedex-update
                 !>(`update:pokedex`[%lookup (~(got by mons) mon.action)])
             ==
         ==
       ~&  'mon no hav'
       (get-mon mon.action)
     ==
  --
++  on-peek  on-peek:def
++  on-watch  on-watch:def
++  on-arvo   on-arvo:def
++  on-leave  on-leave:def
++  on-agent
    |=  [=wire =sign:agent:gall]
    ^-  (quip card _this)

    ::=/  wiresign  [wire sign]
    ::~&  -:!>(wire)
    ::~&  -:!>(sign)
    ::~&  wiresign
    ::?+  wiresign
    ::      ~&  'did not match'
    ::      (on-agent:def wire sign)
    ::    [[%thread-res @ @ ~] [%fact @]]
    ::    `this
    ::                              :: cage
    ::    :: =/  pokeman     !<(json -.wire.wiresign)
    ::    :: =/  attributes  !<(json q.cage.sign.wiresign)

    ::    :: =/  res  !<(json q.cage.sign)
    ::    :: =/  res  "test"

    ::    :: have wire
    ::    :: %-  (slog leaf+"Fetched Pokejson: {(en-json:html res)}" ~)
    ::    :: %-  (slog leaf+"Fetched Pokejson: {res}" ~)
    ::    :: ~&  i.t.wire
    ::==

    ?+    -.wire  (on-agent:def wire sign)
        %thread-res
      ?+    -.sign  (on-agent:def wire sign)
          %poke-ack
        ?~  p.sign
          %-  (slog leaf+"Thread started successfully" ~)
          `this
        %-  (slog leaf+"Thread failed to start" u.p.sign)
        `this
         ::
          %fact
        ?+    p.cage.sign  (on-agent:def wire sign)
            %thread-fail
          =/  err  !<  (pair term tang)  q.cage.sign
          %-  (slog leaf+"Thread failed: {(trip p.err)}" q.err)
          `this
            %thread-done
          =/  res  !<(json q.cage.sign)
          =/  lookedup-mon  -.+.wire
          %-  (slog leaf+"Fetched Pokemon: {(trip lookedup-mon)}" ~)
          `this(mons (~(put by mons) lookedup-mon res))
        ==
      ==
    ==
++  on-fail   on-fail:def
--
