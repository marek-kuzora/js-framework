#
# @require:
#   set:  fierry-pfc/set/set-resource.
#   BSet: fierry/binary/set
#



performance '/set.maintain'

  '    5 length':
    before: -> [@bset, @data] = set.create_all(5)
    run:    -> set.maintain(@bset, @data[F.random(5)])


  '   10 length':
    before: -> [@bset, @data] = set.create_all(10)
    run:    -> set.maintain(@bset, @data[F.random(10)])


  '   20 length':
    before: -> [@bset, @data] = set.create_all(20)
    run:    -> set.maintain(@bset, @data[F.random(20)])


  '   50 length':
    before: -> [@bset, @data] = set.create_all(50)
    run:    -> set.maintain(@bset, @data[F.random(50)])


  '  100 length':
    before: -> [@bset, @data] = set.create_all(100)
    run:    -> set.maintain(@bset, @data[F.random(100)])

  '1 000 length':
    before: -> [@bset, @data] = set.create_all(1000)
    run:    -> set.maintain(@bset, @data[F.random(1000)])
