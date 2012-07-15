#
# Tests hash creation time.
#
performance '/object.create'



#
# Based on its length.
#
performance 'length'

  ' 0 length': -> {}


  ' 5 length': -> a:0, b:1, c:2, d:3, e:4


  '10 length': -> a:0, b:1, c:2, d:3, e:4, f:5, g:6, h:7, i:8, j:9


  '50 length': ->
    aa:0, ba:1, ca:2, da:3, ea:4, fa:5, ga:6, ha:7, ia:8, ja:9
    ab:0, bb:1, cb:2, db:3, eb:4, fb:5, gb:6, hb:7, ib:8, jb:9
    ac:0, bc:1, cc:2, dc:3, ec:4, fc:5, gc:6, hc:7, ic:8, jc:9
    ad:0, bd:1, cd:2, dd:3, ed:4, fd:5, gd:6, hd:7, id:8, jd:9
    ae:0, be:1, ce:2, de:3, ee:4, fe:5, ge:6, he:7, ie:8, je:9



#
# Based on items it contains.
#
# Please note that these tests create the array as well as its items.
# Only 'precomputed' test suite does not recreate items on the each
# test run.
#
performance '/object.create.items'


#
# Items passed inline.
#
performance 'inline'

  'int':      -> a: 0, b: 1, c: 2, d: 3, e: 4


  'string':   -> a: 'a', b: 'b', c: 'c', d: 'd', e: 'e'


  'hash':     -> a: {}, b: {}, c: {}, d: {}, e: {}


  'array':    -> a: [], b: [], c: [], d: [], e: []


  'function': -> a: (->), b: (->), c: (->), d: (->), e: (->)



#
# Items passed as references.
#
performance 'references'

  'int': ->
    a = 0; b = 1; c = 2; d = 3; e = 4
    a: a, b: b, c: c, d: d, e: e


  'string': ->
    a = 'a'; b = 'b'; c = 'c'; d = 'd'; e = 'e'
    a: a, b: b, c: c, d: d, e: e


  'hash': ->
    a = {}; b = {}; c = {}; d = {}; e = {}
    a: a, b: b, c: c, d: d, e: e


  'array': ->
    a = []; b = []; c = []; d = []; e = []
    a: a, b: b, c: c, d: d, e: e


  'function': ->
    a = (->); b = (->); c = (->); d = (->); e = (->)
    a: a, b: b, c: c, d: d, e: e



#
# Precomputed items passed as references.
#
performance 'precomputed'

  'int':
    before: -> @a = 0; @b = 1; @c = 2; @d = 3; @e = 4
    run:    -> a: @a, b: @b, c: @c, d: @d, e: @e


  'string':
    before: -> @a = 'a'; @b = 'b'; @c = 'c'; @d = 'd'; @e = 'e'
    run:    -> a: @a, b: @b, c: @c, d: @d, e: @e


  'hash':
    before: -> @a = {}; @b = {}; @c = {}; @d = {}; @e = {}
    run:    -> a: @a, b: @b, c: @c, d: @d, e: @e


  'array':
    before: -> @a = []; @b = []; @c = []; @d = []; @e = []
    run:    -> a: @a, b: @b, c: @c, d: @d, e: @e


  'function':
    before: -> @a = (->); @b = (->); @c = (->); @d = (->); @e = (->)
    run:    -> a: @a, b: @b, c: @c, d: @d, e: @e



#
# Creating hashes via Object.create(). Based on hash length.
#
performance '/object.create.ECMA_5'

  ' 0 length':
    before: -> @h = {}
    run:    -> Object.create(@h)


  ' 5 length':
    before: -> @h = a:0, b:1, c:2, d:3, e:4
    run:    -> Object.create(@h)


  '10 length':
    before: -> @h = a:0, b:1, c:2, d:3, e:4, f:5, g:6, h:7, i:8, j:9
    run:    -> Object.create(@h)


  '50 length':
    before: ->
      @h =
        aa:0, ba:1, ca:2, da:3, ea:4, fa:5, ga:6, ha:7, ia:8, ja:9
        ab:0, bb:1, cb:2, db:3, eb:4, fb:5, gb:6, hb:7, ib:8, jb:9
        ac:0, bc:1, cc:2, dc:3, ec:4, fc:5, gc:6, hc:7, ic:8, jc:9
        ad:0, bd:1, cd:2, dd:3, ed:4, fd:5, gd:6, hd:7, id:8, jd:9
        ae:0, be:1, ce:2, de:3, ee:4, fe:5, ge:6, he:7, ie:8, je:9

    run: ->
      Object.create(@h)
