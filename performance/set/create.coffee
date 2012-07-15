#
# @require:
#   set: fierry-pfc/set/set-resource.
#
#   hash: fest/generator/hash.
#   BSet: fierry/binary/set
#



performance '/set.create'



performance 'sorted'

  '    0 length': -> new BSet()


  '    5 length':
    before: -> @data = hash.array(5, true)
    run:    -> set.create(@data)


  '   10 length':
    before: -> @data = hash.array(10, true)
    run:    -> set.create(@data)


  '   20 length':
    before: -> @data = hash.array(20, true)
    run:    -> set.create(@data)


  '   50 length':
    before: -> @data = hash.array(50, true)
    run:    -> set.create(@data)


  '  100 length':
    before: -> @data = hash.array(100, true)
    run:    -> set.create(@data)


  '1 000 length':
    before: -> @data = hash.array(1000, true)
    run:    -> set.create(@data)



performance 'unsorted'

  '    5 length':
    before: -> @data = hash.array(5)
    run:    -> set.create(@data)


  '   10 length':
    before: -> @data = hash.array(10)
    run:    -> set.create(@data)


  '   20 length':
    before: -> @data = hash.array(20)
    run:    -> set.create(@data)


  '   50 length':
    before: -> @data = hash.array(50)
    run:    -> set.create(@data)


  '  100 length':
    before: -> @data = hash.array(100)
    run:    -> set.create(@data)


  '1 000 length':
    before: -> @data = hash.array(1000)
    run:    -> set.create(@data)
