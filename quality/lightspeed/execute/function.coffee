#
# Tests function execution time.
#
lightspeed '/execute.function'



lightspeed 'empty'

  'direct': (i) ->
    fn = ->
    fn() while i--
    return

  
  'via call': (i) ->
    fn = ->
    fn.call() while i--
    return


  'via call with scope': (i) ->
    fn = ->
    sc = {}
    fn.call(sc) while i--
    return
  



lightspeed 'array_fn'

  '0 length': (i) ->
    array = []
    fn() for fn in array while i--
    return


  '1 length': (i) ->
    array = [(->)]
    fn() for fn in array while i--
    return


  '2 length': (i) ->
    array = [(->), (->)]
    fn() for fn in array while i--
    return



lightspeed 'create_wrapping'

  'string': (i) ->
    x = 'string' while i--
    return


  'string -fn': (i) ->
    fn = -> x = 'string'
    fn() while i--
    return


  'string -fn -call': (i) ->
    fn = -> x = 'string'
    fn.call() while i--
    return


  'array': (i) ->
    x = [] while i--
    return


  'array -fn': (i) ->
    fn = -> x = []
    fn() while i--
    return


  'array -fn -call': (i) ->
    fn = -> x = []
    fn.call() while i--
    return

