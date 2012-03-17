#
# Tests hash creation time.
#
lightspeed '/create.hash'



#
# Based on its length.
#
lightspeed 'length'

  ' 0 length': (i) ->
    h = {} while i--
    return


  ' 5 length': (i) ->
    h = {a:0, b:1, c:2, d:3, e:4} while i--
    return


  '10 length': (i) ->
    h = {a:0, b:1, c:2, d:3, e:4, f:5, g:6, h:7, i:8, j:9} while i--
    return


  '50 length -hash': (i) ->
    while i--
      h = {
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
    h = {a: 0, b: 1, c: 2, d: 3, e: 4} while i--
    return


  'string': (i) ->
    h = {a: 'a', b: 'b', c: 'c', d: 'd', e: 'e'} while i--
    return


  'function': (i) ->
    h = {a: (->), b: (->), c: (->), d: (->), e: (->)} while i--
    return


  'hash': (i) ->
    h = {a: {}, b: {}, c: {}, d: {}, e: {}} while i--
    return


  'array': (i) ->
    h = {a: [], b: [], c: [], d: [], e: []} while i--
    return


  'references': (i) ->
      _0 = []
      _1 = []
      _2 = []
      _3 = []
      _4 = []
      h = {a: _0, b: _1, c: _2, d: _3, e: _4} while i--
      return



#
# Creating hashes via Object.create(). Based on hash length.
#
lightspeed 'ECMA_5'

  ' 0 length': (i) ->
    h = {}

    Object.create(h) while i--
    return


  ' 5 length': (i) ->
    h = {a:0, b:1, c:2, d:3, e:4}

    Object.create(h) while i--
    return


  '10 length': (i) ->
    h = {a:0, b:1, c:2, d:3, e:4, f:5, g:6, h:7, i:8, j:9}

    Object.create(h) while i--
    return


  '50 length': (i) ->
    h = {
      aa:0, ba:1, ca:2, da:3, ea:4, fa:5, ga:6, ha:7, ia:8, ja:9
      ab:0, bb:1, cb:2, db:3, eb:4, fb:5, gb:6, hb:7, ib:8, jb:9
      ac:0, bc:1, cc:2, dc:3, ec:4, fc:5, gc:6, hc:7, ic:8, jc:9
      ad:0, bd:1, cd:2, dd:3, ed:4, fd:5, gd:6, hd:7, id:8, jd:9
      ae:0, be:1, ce:2, de:3, ee:4, fe:5, ge:6, he:7, ie:8, je:9
    }
    Object.create(h) while i--
    return



#
# When its items are created inline versus created just before 
# & passed as references.
#
lightspeed 'nested'

  'function -nested': (i) ->
    h = {a: (->), b: (->), c: (->), d: (->), e: (->)} while i--
    return


  'function -reference': (i) ->
    while i--
      _0 = ->
      _1 = ->
      _2 = ->
      _3 = ->
      _4 = ->
      h = {a: _0, b: _1, c: _2, d: _3, e: _4}
    return


  'hash -nested': (i) ->
    h = {a: {}, b: {}, c: {}, d: {}, e: {}} while i--
    return


  'hash -reference': (i) ->
    while i--
      _0 = {}
      _1 = {}
      _2 = {}
      _3 = {}
      _4 = {}
      h = {a: _0, b: _1, c: _2, d: _3, e: _4}
    return


  'array -nested': (i) ->
    h = {a: [], b: [], c: [], d: [], e: []} while i--
    return

  
  'array -reference': (i) ->
    while i--
      _0 = []
      _1 = []
      _2 = []
      _3 = []
      _4 = []
      h = {a: _0, b: _1, c: _2, d: _3, e: _4}
    return



#
# Tests assigning properties to hash execution time.
#
lightspeed '/create.hash.assign'



#
# Dynamic assigning via string versus static assign.
#
lightspeed 'type'

  'dynamic': (i) ->
    while i--
      h = {}
      h['a'] = 0; h['b'] = 1; h['c'] = 2; h['d'] = 3; h['e'] = 4
    return


  'static': (i) ->
    while i--
      h = {}
      h.a = 0; h.b= 1; h.c = 2; h.d = 3; h.e = 4
    return



#
# Based on number of properites.
#
# It seems that Chrome has real problems with optimizing multiple
# properties assign. Every 3 items the performance drops
# significantly.
#
lightspeed 'length'

  ' 1 length': (i) ->
    while i--
      h = {}
      h.a = 1
    return


  ' 4 length': (i) ->
    while i--
      h = {}
      h.a = 1; h.b = 1; h.c = 1; h.d = 1
    return


  ' 7 length': (i) ->
    while i--
      h = {}
      h.a = 1; h.b = 1; h.c = 1; h.d = 1; h.e = 1; h.f = 1; h.g = 1
    return


  '10 length': (i) ->
    while i--
      h = {}
      h.a = 1; h.b = 1; h.c = 1; h.d = 1; h.e = 1; h.f = 1; h.g = 1
      h.h = 1; h.i = 1; h.j = 1
    return


  '15 length': (i) ->
    while i--
      h = {}
      h.a = 1; h.b = 1; h.c = 1; h.d = 1; h.e = 1; h.f = 1; h.g = 1
      h.h = 1; h.i = 1; h.j = 1; h.aa = 1; h.ba = 1; h.ca = 1; h.da = 1
      h.ea = 1; h.fa = 1
    return


  '20 length': (i) ->
    while i--
      h = {}
      h.a = 1; h.b = 1; h.c = 1; h.d = 1; h.e = 1; h.f = 1; h.g = 1
      h.h = 1; h.i = 1; h.j = 1; h.aa = 1; h.ba = 1; h.ca = 1; h.da = 1
      h.ea = 1; h.fa = 1; h.ga = 1; h.ha = 1; h.ia = 1; h.ja = 1
    return


  '40 length': (i) ->
    while i--
      h = {}
      h.a = 1; h.b = 1; h.c = 1; h.d = 1; h.e = 1; h.f = 1; h.g = 1
      h.h = 1; h.i = 1; h.j = 1; h.aa = 1; h.ba = 1; h.ca = 1; h.da = 1
      h.ea = 1; h.fa = 1; h.ga = 1; h.ha = 1; h.ia = 1; h.ja = 1; h.ab = 1
      h.bb = 1; h.cb = 1; h.db = 1; h.eb = 1; h.fb = 1; h.gb = 1; h.hb = 1
      h.ib = 1; h.jb = 1; h.ac = 1; h.bc = 1; h.cc = 1; h.dc = 1; h.ec = 1
      h.fc = 1; h.gc = 1; h.hc = 1; h.ic = 1; h.jc = 1
    return
