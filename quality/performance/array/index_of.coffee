#
# @require: 
#   base: fest/generator/base.
#   number: fest/generator/number.  
#



performance '/array.index_of',

  '     0 length':
    before: -> @arr = []
    run:    -> @arr.indexOf(-1)

  '     5 length':
    before: -> @arr = base.array_5()
    run:    -> @arr.indexOf(-1)

  '    10 length':
    before: -> @arr = base.array_10()
    run:    -> @arr.indexOf(-1)

  '    20 length':
    before: -> @arr = base.array_20()
    run:    -> @arr.indexOf(-1)

  '    50 length':
    before: -> @arr = base.array_50()
    run:    -> @arr.indexOf(-1)


  '   500 length':
    before: -> @arr = number.array(500)
    run:    -> @arr.indexOf(-1)


  ' 5 000 length':
    before: -> @arr = number.array(5000)
    run:    -> @arr.indexOf(-1)


  '50 000 length':
    before: -> @arr = number.array(50000)
    run:    -> @arr.indexOf(-1)

