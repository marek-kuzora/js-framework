#
# @require: 
#   base: fest/generator/base
#   string: fest/generator/string.   
#



performance '/object.access'



performance 'type'

  'static':
    before: -> @h = base().hash_10()
    run:    -> @h.aa


  'dynamic':
    before: -> @h = base().hash_10()
    run:    -> @h['aa']


  'existing':
    before: ->
      @h = base().hash_10()
      @k = Object.keys(@h)

    run: (i) -> @h[@k[i % 10]]


  'undefined':
    before: ->
      @h = {}
      @k = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j']

    run: (i) -> @h[@k[i % 10]]



performance '/object.access.cache'



performance 'base'
  before: ->
    @h = base().hash_100()
    @k = Object.keys(@h)

  
  ' 10 range': (i) -> @h[@k[i % 10]]


  ' 50 range': (i) -> @h[@k[i % 50]]


  '100 range': (i) -> @h[@k[i % 100]]



performance 'ratio_100'
  before: ->
    @k = string.array(100000, 5, true)
    @h = string.hash(100000, 5, 100)

  
  '     10 range': (i) -> @h[@k[i % 10]]


  '     50 range': (i) -> @h[@k[i % 50]]


  '    100 range': (i) -> @h[@k[i % 100]]

  
  '  1 000 range': (i) -> @h[@k[i % 1000]]


  ' 10 000 range': (i) -> @h[@k[i % 10000]]


  '100 000 range': (i) -> @h[@k[i % 100000]]



performance 'ratio_50'
  before: ->
    @k = string.array(100000, 5, true)
    @h = string.hash(100000, 5, 50)

  
  '     10 range': (i) -> @h[@k[i % 10]]


  '     50 range': (i) -> @h[@k[i % 50]]


  '    100 range': (i) -> @h[@k[i % 100]]

  
  '  1 000 range': (i) -> @h[@k[i % 1000]]


  ' 10 000 range': (i) -> @h[@k[i % 10000]]


  '100 000 range': (i) -> @h[@k[i % 100000]]



performance 'ratio_00'
  before: ->
    @k = string.array(100000, 5, true)
    @h = {}

  
  '     10 range': (i) -> @h[@k[i % 10]]


  '     50 range': (i) -> @h[@k[i % 50]]


  '    100 range': (i) -> @h[@k[i % 100]]

  
  '  1 000 range': (i) -> @h[@k[i % 1000]]


  ' 10 000 range': (i) -> @h[@k[i % 10000]]


  '100 000 range': (i) -> @h[@k[i % 100000]]
