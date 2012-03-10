#
# Tests array creation time.
#
lightspeed '/create.array'



#
# Based on its length.
#
lightspeed 'length'

  ' 0 length': (i) ->
    a = [] while i--
    return


  ' 5 length': (i) ->
    a = [0, 1, 2, 3, 4] while i--
    return


  '10 length': (i) ->
    a = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] while i--
    return


  '50 length': (i) ->
    while i--
      a = [
        0, 1, 2, 3, 4, 5, 6, 7, 8, 9
        0, 1, 2, 3, 4, 5, 6, 7, 8, 9
        0, 1, 2, 3, 4, 5, 6, 7, 8, 9
        0, 1, 2, 3, 4, 5, 6, 7, 8, 9
        0, 1, 2, 3, 4, 5, 6, 7, 8, 9
      ]
    return



#
# Based on items it contains.
#
# Please note that these tests create the array as well as its items.
# Only 'reference' test case does not recreate items on the each test
# run.
#
lightspeed 'items'

  'int': (i) ->
    a = [0, 1, 2, 3, 4] while i--
    return


  'string': (i) ->
    a = ['a', 'b', 'c', 'd', 'e'] while i--
    return


  'function': (i) ->
    a = [(->), (->), (->), (->), (->)] while i--
    return


  'hash': (i) ->
    a = [{}, {}, {}, {}, {}] while i--
    return


  'array': (i) ->
    a = [[], [], [], [], []] while i--
    return


  'references': (i) ->
      _0 = []
      _1 = []
      _2 = []
      _3 = []
      _4 = []
      a = [_0, _1, _2, _3, _4] while i--
      return



#
# When its items are created inline versus created just before 
# & passed as references.
#
lightspeed 'nested'

  'function -nested': (i) ->
    a = [(->), (->), (->), (->), (->)] while i--
    return


  'function -reference': (i) ->
    while i--
      _0 = ->
      _1 = ->
      _2 = ->
      _3 = ->
      _4 = ->
      a = [_0, _1, _2, _3, _4]
    return


  'hash -nested': (i) ->
    a = [{}, {}, {}, {}, {}] while i--
    return


  'hash -reference': (i) ->
    while i--
      _0 = {}
      _1 = {}
      _2 = {}
      _3 = {}
      _4 = {}
      a = [_0, _1, _2, _3, _4]
    return


  'array -nested': (i) ->
    a = [[], [], [], [], []] while i--
    return


  'array -reference': (i) ->
    while i--
      _0 = []
      _1 = []
      _2 = []
      _3 = []
      _4 = []
      a = [_0, _1, _2, _3, _4]
    return



#
# When its items are created inline versus using direct assing or
# push method.
#
lightspeed 'assign'

  'inline': (i) ->
    a = [0, 1, 2, 3, 4] while i--
    return


  'direct': (i) ->
    while i--
      a = []
      a[0] = 0
      a[1] = 1
      a[2] = 2
      a[3] = 3
      a[4] = 4
    return


  'push': (i) ->
    while i--
      a = []
      a.push(0)
      a.push(1)
      a.push(2)
      a.push(3)
      a.push(4)
    return
