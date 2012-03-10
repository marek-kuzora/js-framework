#
# Tests hash creation time.
#
lightspeed '/create.hash'



#
# Based on its length.
#
lightspeed 'length'

  ' 0 length': (i) ->
    a = {} while i--
    return


  ' 5 length': (i) ->
    a = {a:0, b:1, c:2, d:3, e:4} while i--
    return


  '10 length': (i) ->
    a = {a:0, b:1, c:2, d:3, e:4, f:5, g:6, h:7, i:8, j:9} while i--
    return


  '50 length -hash': (i) ->
    while i--
      a = {
        aa:0, ba:1, ca:2, da:3, ea:4, fa:5, ga:6, ha:7, ia:8, ja:9
        ab:0, bb:1, cb:2, db:3, eb:4, fb:5, gb:6, hb:7, ib:8, jb:9
        ac:0, bc:1, cc:2, dc:3, ec:4, fc:5, gc:6, hc:7, ic:8, jc:9
        ad:0, bd:1, cd:2, dd:3, ed:4, fd:5, gd:6, hd:7, id:8, jd:9
        ae:0, be:1, ce:2, de:3, ee:4, fe:5, ge:6, he:7, ie:8, je:9
      }
    return



#
# Based on items it contains.
#
# Please note that these tests create the hash as well as its items.
# Only 'reference' test case does not recreate items on the each test
# run.
#
lightspeed 'items'

  'int': (i) ->
    a = {a: 0, b: 1, c: 2, d: 3, e: 4} while i--
    return


  'string': (i) ->
    a = {a: 'a', b: 'b', c: 'c', d: 'd', e: 'e'} while i--
    return


  'function': (i) ->
    a = {a: (->), b: (->), c: (->), d: (->), e: (->)} while i--
    return


  'hash': (i) ->
    a = {a: {}, b: {}, c: {}, d: {}, e: {}} while i--
    return


  'array': (i) ->
    a = {a: [], b: [], c: [], d: [], e: []} while i--
    return


  'references': (i) ->
      _0 = []
      _1 = []
      _2 = []
      _3 = []
      _4 = []
      a = {a: _0, b: _1, c: _2, d: _3, e: _4} while i--
      return



#
# When its items are created inline versus created just before 
# & passed as references.
#
lightspeed 'nested'

  'function -nested': (i) ->
    a = {a: (->), b: (->), c: (->), d: (->), e: (->)} while i--
    return


  'function -reference': (i) ->
    while i--
      _0 = ->
      _1 = ->
      _2 = ->
      _3 = ->
      _4 = ->
      a = {a: _0, b: _1, c: _2, d: _3, e: _4}
    return


  'hash -nested': (i) ->
    a = {a: {}, b: {}, c: {}, d: {}, e: {}} while i--
    return


  'hash -reference': (i) ->
    while i--
      _0 = {}
      _1 = {}
      _2 = {}
      _3 = {}
      _4 = {}
      a = {a: _0, b: _1, c: _2, d: _3, e: _4}
    return


  'array -nested': (i) ->
    a = {a: [], b: [], c: [], d: [], e: []} while i--
    return

  
  'array -reference': (i) ->
    while i--
      _0 = []
      _1 = []
      _2 = []
      _3 = []
      _4 = []
      a = {a: _0, b: _1, c: _2, d: _3, e: _4}
    return



#
# When its items are created inline versus using direct assing.
#
lightspeed 'assign'

  'inline': (i) ->
    a = {a: 0, b: 1, c: 2, d: 3, e: 4} while i--
    return


  'direct': (i) ->
    while i--
      a = {}
      a['a'] = 0
      a['b'] = 1
      a['c'] = 2
      a['d'] = 3
      a['e'] = 4
    return
