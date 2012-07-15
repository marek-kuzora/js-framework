performance '/fierry.uid',

  'write':
    before_each: -> @o = {}
    run:         -> F.uid(@o)

  'read':
    before: -> @o = {}
    run:    -> F.uid(@o)

  'hash test':
    before:      -> @h = []
    before_each: -> @o = {}
    run:         -> @h[F.uid(@o)] = 1


  'hash 20 test':
    before: ->
      @h = []
      @a = [{}, {}, {}, {}, {}, {}, {}, {}, {}, {}
            {}, {}, {}, {}, {}, {}, {}, {}, {}, {}]
    before_each: ->
      @o = @a[F.random(19)]
    run: -> @h[F.uid(@o)] = 1
