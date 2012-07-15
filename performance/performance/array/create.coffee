# Creating arrays.
performance '/array.create'



#
# Based on its length.
#
performance 'length'

  ' 0 length': -> []


  ' 5 length': -> [0, 1, 2, 3, 4]


  '10 length': -> [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]


  '50 length': ->
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9
     0, 1, 2, 3, 4, 5, 6, 7, 8, 9
     0, 1, 2, 3, 4, 5, 6, 7, 8, 9
     0, 1, 2, 3, 4, 5, 6, 7, 8, 9
     0, 1, 2, 3, 4, 5, 6, 7, 8, 9]



#
# Based on items it contains.
#
# Please note that these tests create the array as well as its items.
# Only 'precomputed' test suite does not recreate items on the each
# test run.
#
performance '/array.create.items'



#
# Items passed inline.
#
performance 'inline'

  'int':      -> [0, 1, 2, 3, 4]


  'string':   -> ['a', 'b', 'c', 'd', 'e']


  'hash':     -> [{}, {}, {}, {}, {}]


  'array':    -> [[], [], [], [], []]


  'function': -> [(->), (->), (->), (->), (->)]



#
# Items passed as references.
#
performance 'references'

  'int': ->
    a = 0; b = 1; c = 2; d = 3; e = 4
    [a, b, c, d, e]


  'string': ->
    a = 'a'; b = 'b'; c = 'c'; d = 'd'; e = 'e'
    [a, b, c, d, e]


  'hash': ->
    a = {}; b = {}; c = {}; d = {}; e = {}
    [a, b, c, d, e]


  'array': ->
    a = []; b = []; c = []; d = []; e = []
    [a, b, c, d, e]


  'function': ->
    a = (->); b = (->); c = (->); d = (->); e = (->)
    [a, b, c, d, e]



#
# Precomputed items passed as references.
#
performance 'precomputed'

  'int':
    before: -> @a = 0; @b = 1; @c = 2; @d = 3; @e = 4
    run:    -> [@a, @b, @c, @d, @e]

  'string':
    before: -> @a = 'a'; @b = 'b'; @c = 'c'; @d = 'd'; @e = 'e'
    run:    -> [@a, @b, @c, @d, @e]

  'hash':
    before: -> @a = {}; @b = {}; @c = {}; @d = {}; @e = {}
    run:    -> [@a, @b, @c, @d, @e]

  'array':
    before: -> @a = []; @b = []; @c = []; @d = []; @e = []
    run:    -> [@a, @b, @c, @d, @e]


  'function':
    before: -> @a = (->); @b = (->); @c = (->); @d = (->); @e = (->)
    run:    -> [@a, @b, @c, @d, @e]
