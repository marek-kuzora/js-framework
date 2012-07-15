#
# @require: 
#   base: fest/generator/base
#   string: fest/generator/string.  
#



performance '/array.access'



performance 'type'

  'static':
    before: -> @a = base().array_10()
    run:    -> @a[0]

  'existing':
    before:  -> @a = base().array_10()
    run: (i) -> @a[i % 10]


  'undefined':
    before:  -> @a = []
    run: (i) -> @a[i % 10]



performance '/array.access.cache'



performance 'base'
  before: ->
    @a = base().array_100()

  
  ' 10 range': (i) -> @a[i % 10]


  ' 50 range': (i) -> @a[i % 50]


  '100 range': (i) -> @a[i % 100]



performance 'ratio_100'
  before: ->
    @a = string.array(100000, 5)

  
  '     10 range': (i) -> @a[i % 10]


  '     50 range': (i) -> @a[i % 50]


  '    100 range': (i) -> @a[i % 100]

  
  '  1 000 range': (i) -> @a[i % 1000]


  ' 10 000 range': (i) -> @a[i % 10000]


  '100 000 range': (i) -> @a[i % 100000]



performance 'ratio_0'
  before: ->
    @a = []

  
  '     10 range': (i) -> @a[i % 10]


  '     50 range': (i) -> @a[i % 50]


  '    100 range': (i) -> @a[i % 100]

  
  '  1 000 range': (i) -> @a[i % 1000]


  ' 10 000 range': (i) -> @a[i % 10000]


  '100 000 range': (i) -> @a[i % 100000]
