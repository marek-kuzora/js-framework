#
# @require:
#   set: fierry-pfc/set/set-resource.
#   hash: fest/generator/hash.
#
#   BSet: fierry/binary/set
#



performance '/set.iterate'



performance 'in_order'

  ' 0 length':
    before: -> @bset = set.create()
    run:    -> set.iterate(@bset, true)

  ' 5 length':
    before: -> @bset = set.create(hash.array(5))
    run:    -> set.iterate(@bset, true)

  '10 length':
    before: -> @bset = set.create(hash.array(10))
    run:    -> set.iterate(@bset, true)

  '20 length':
    before: -> @bset = set.create(hash.array(20))
    run:    -> set.iterate(@bset, true)

  '50 length':
    before: -> @bset = set.create(hash.array(50))
    run:    -> set.iterate(@bset, true)


  '100 length':
    before: -> @bset = set.create(hash.array(100))
    run:    -> set.iterate(@bset, true)


  '1000 length':
    before: -> @bset = set.create(hash.array(1000))
    run:    -> set.iterate(@bset, true)



performance 'pre_order'

  ' 0 length':
    before: -> @bset = set.create()
    run:    -> set.iterate(@bset, false)


  ' 5 length':
    before: -> @bset = set.create(hash.array(5))
    run:    -> set.iterate(@bset, false)


  '10 length':
    before: -> @bset = set.create(hash.array(10))
    run:    -> set.iterate(@bset, false)


  '20 length':
    before: -> @bset = set.create(hash.array(20))
    run:    -> set.iterate(@bset, false)


  '50 length':
    before: -> @bset = set.create(hash.array(50))
    run:    -> set.iterate(@bset, false)


  '100 length':
    before: -> @bset = set.create(hash.array(100))
    run:    -> set.iterate(@bset, false)


  '1000 length':
    before: -> @bset = set.create(hash.array(1000))
    run:    -> set.iterate(@bset, false)
