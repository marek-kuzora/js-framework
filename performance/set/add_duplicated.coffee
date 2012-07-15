#
# @require:
#   set:  fierry-pfc/set/set-resource.
#   BSet: fierry/binary/set
#



performance '/set.add_duplicated'

  '    5 length':
    before: -> [@bset, @data] = set.create_all(5)
    run:    -> @bset.add(@data[@data.length - 1])

  '   10 length':
    before: -> [@bset, @data] = set.create_all(10)
    run:    -> @bset.add(@data[@data.length - 1])

  '   20 length':
    before: -> [@bset, @data] = set.create_all(20)
    run:    -> @bset.add(@data[@data.length - 1])

  '   50 length':
    before: -> [@bset, @data] = set.create_all(50)
    run:    -> @bset.add(@data[@data.length - 1])

  '  100 length':
    before: -> [@bset, @data] = set.create_all(100)
    run:    -> @bset.add(@data[@data.length - 1])

  '1 000 length':
    before: -> [@bset, @data] = set.create_all(1000)
    run:    -> @bset.add(@data[@data.length - 1])
