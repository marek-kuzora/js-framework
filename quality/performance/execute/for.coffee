#
# @require:
#   base: fest/generator/base.
#



performance '/execute.for'



performance 'array'

  ' 0 length':
    before: -> @a = []
    run:    -> v for v, k in @a

  ' 5 length':
    before: -> @a = base.array_5()
    run:    -> v for v, k in @a

  '10 length':
    before: -> @a = base.array_10()
    run:    -> v for v, k in @a

  '20 length':
    before: -> @a = base.array_20()
    run:    -> v for v, k in @a

  '50 length':
    before: -> @a = base.array_50()
    run:    -> v for v, k in @a



performance 'array_foreach'

  ' 0 length':
    before: -> @fn = (->); @a = []
    run:    -> @a.forEach(@fn)

  ' 5 length':
    before: -> @fn = (->); @a = base.array_5()
    run:    -> @a.forEach(@fn)

  '10 length':
    before: -> @fn = (->); @a = base.array_10()
    run:    -> @a.forEach(@fn)

  '20 length':
    before: -> @fn = (->); @a = base.array_20()
    run:    -> @a.forEach(@fn)

  '50 length':
    before: -> @fn = (->); @a = base.array_50()
    run:    -> @a.forEach(@fn)



performance 'hash'

  ' 0 length':
    before: -> @h = []
    run:    -> v for k, v of @h

  ' 5 length':
    before: -> @h = base.hash_5()
    run:    -> v for k, v of @h

  '10 length':
    before: -> @h = base.hash_10()
    run:    -> v for k, v of @h

  '20 length':
    before: -> @h = base.hash_20()
    run:    -> v for k, v of @h

  '50 length':
    before: -> @h = base.hash_50()
    run:    -> v for k, v of @h

