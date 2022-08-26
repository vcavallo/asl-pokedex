/+  *ccssvv
|_  csv=(list (list @t))
++  grab  :: convert TO csv FROM other marks
  |%
  ++  mime  |=((pair mite octs) (de-csv q.q))  :: convert FROM mime to our csv mark
      :: noun arm is mandatory in grab.
  ++  noun  :: convert TO csv FROM noun
    |=  n=*
    ^-  (list (list @t))
    =/  result  ((list (list @t)) n)
    ?>  (validate result)
    result
  --
++  grow  :: convert FROM other marks TO csv
  |%
  ++  mime
    ?>  (validate csv)
    [/text/csv (as-octs:mimes:html (en-csv csv))] :: run result of en-csv through
                                                  :: as-octs to give
                                                  :: byte-length
  ++  noun
    ?>  (validate csv)  :: as long as it's valid csv...
    csv                 :: return it as a noun (what it was coming in)
  --
++  grad  %noun :: grad is for revision control.
                :: since we already have a noun conversion, we can just
                :: let %noun grad handle this, then it will convert back
                :: to a csv after upgrading.
--
