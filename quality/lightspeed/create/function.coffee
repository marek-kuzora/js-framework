#
# Tests function creation time.
#
lightspeed '/create.function'



lightspeed 'one_line'

  'empty': (i) ->
    fn = (->) while i--
    return


  'simple': (i) ->
    (fn = (a,b,c) -> a+b+c) while i--
    return


  'binded': (i) ->
    arg = 1
    (fn = -> arg) while i--
    return


  # This is not complex!
  'complex': (i) ->
    while i--
      fn = -> ['a', ['a', 'b', 'c'], 'b', ['a', 'b', 'c'], 'c']
    return



lightspeed 'three_lines'

  'simple': (i) ->
    while i--
      fn = (a,b,c) ->
        while a != b
          a++
          b--
    return


  'complex': (i) ->
    while i--
      fn = (a,b,c) ->
        x = ['a', ['a', 'b', 'c'], 'b', ['a', 'b', 'c'], 'c']
        y = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        return {x: x, y: y}
    return
