log = (name, args, time) ->
  console.log name, args, 'args', time, 'ms', ~~(args/1000/time), 'k ops/ms'

return tests =

  'empty': ->
    fn = ->

    for args in [500000, 1000000, 5000000, 10000000, 50000000]
      start = new Date()
      i = args

      while i--
        fn()

      log('empty', args, new Date() - start)


  'empty -call': ->
    fn = ->

    for args in [500000, 1000000, 5000000, 10000000]
      start = new Date()
      i = args

      while i--
        fn.call()

      log('empty -call', args, new Date() - start)


  'empty-array-fn': ->
    array = []

    for args in [500000, 1000000, 5000000, 10000000, 25000000]
      start = new Date()
      i = args

      while i--
        fn() for fn in array

      log('empty-array-fn', args, new Date() - start)


  'one-array-fn': ->
    array = [->]

    for args in [500000, 1000000, 5000000, 10000000, 25000000]
      start = new Date()
      i = args

      while i--
        fn() for fn in array

      log('one-array-fn', args, new Date() - start)


  'one-array-fn -call': ->
    array = [->]

    for args in [500000, 1000000, 5000000, 10000000, 25000000]
      start = new Date()
      i = args

      while i--
        fn.call() for fn in array

      log('one-array-fn -call', args, new Date() - start)


  'string': ->
    for args in [5000000, 10000000, 50000000]
      start = new Date()
      i = args

      while i--
        x = "new basic string"

      log('string', args, new Date() - start)


  'string -fn': ->
    fn = -> x = "new basic string"

    for args in [5000000, 10000000, 50000000]
      start = new Date()
      i = args

      while i--
        fn()

      log('string -fn', args, new Date() - start)


  'string -fn -call': ->
    fn = -> x = "new basic string"

    for args in [5000000, 10000000, 50000000]
      start = new Date()
      i = args

      while i--
        fn.call()

      log('string -fn -call', args, new Date() - start)


  'hash': ->
    for args in [1000000, 5000000, 10000000]
      start = new Date()
      i = args

      while i--
        x = {}

      log('hash', args, new Date() - start)


  'hash -fn': ->
    fn = -> x = {}

    for args in [1000000, 5000000, 10000000]
      start = new Date()
      i = args

      while i--
        fn()

      log('hash -fn', args, new Date() - start)


  'hash -fn -call': ->
    fn = -> x = {}

    for args in [1000000, 5000000, 10000000]
      start = new Date()
      i = args

      while i--
        fn.call()

      log('hash -fn -call', args, new Date() - start)

