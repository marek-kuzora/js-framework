#
# @require:
#   set: fierry-qa/performance/set/set-resource.
#   BSet:     fierry/binary/set
#



performance '/set.contains'



performance 'sorted'

  '    5 length':
    before: ->
      [@bset, @data] = set.create_all(5, true)
      @item = @data[F.random(5)]
    run: ->
      @bset.contains(@item)


  '   10 length':
    before: ->
      [@bset, @data] = set.create_all(10, true)
      @item = @data[F.random(10)]
    run: ->
      @bset.contains(@item)


  '   20 length':
    before: ->
      [@bset, @data] = set.create_all(20, true)
      @item = @data[F.random(20)]
    run: ->
      @bset.contains(@item)


  '   50 length':
    before: ->
      [@bset, @data] = set.create_all(50, true)
      @item = @data[F.random(50)]
    run: ->
      @bset.contains(@item)


  '  100 length':
    before: ->
      [@bset, @data] = set.create_all(100, true)
      @item = @data[F.random(100)]
    run: ->
      @bset.contains(@item)


  '1 000 length':
    before: ->
      [@bset, @data] = set.create_all(1000, true)
      @item = @data[F.random(1000)]
    run: ->
      @bset.contains(@item)



performance 'unsorted'

  '    5 length':
    before: ->
      [@bset, @data] = set.create_all(5)
      @item = @data[F.random(5)]
    run: ->
      @bset.contains(@item)


  '   10 length':
    before: ->
      [@bset, @data] = set.create_all(10)
      @item = @data[F.random(10)]
    run: ->
      @bset.contains(@item)


  '   20 length':
    before: ->
      [@bset, @data] = set.create_all(20)
      @item = @data[F.random(20)]
    run: ->
      @bset.contains(@item)


  '   50 length':
    before: ->
      [@bset, @data] = set.create_all(50)
      @item = @data[F.random(50)]
    run: ->
      @bset.contains(@item)


  '  100 length':
    before: ->
      [@bset, @data] = set.create_all(100)
      @item = @data[F.random(100)]
    run: ->
      @bset.contains(@item)


  '1 000 length':
    before: ->
      [@bset, @data] = set.create_all(1000)
      @item = @data[F.random(1000)]
    run: ->
      @bset.contains(@item)
