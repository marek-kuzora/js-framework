performance '/fierry.lang'

  'bool':
    before: -> @x = true
    run:    -> F.is_boolean(@x)

  'bool -object':
    before: -> @x = new Boolean(true)
    run:    -> F.is_boolean(@x)

  'number':
    before: -> @x = 12
    run:    -> F.is_number(@x)

  'number -object':
    before: -> @x = new Number(12)
    run:    -> F.is_number(@x)

  'string':
    before: -> @x = 'dada'
    run:    -> F.is_string(@x)

  'string -object':
    before: -> @x = new String('dada')
    run:    -> F.is_string(@x)

  'function':
    before: -> @x = ->
    run:    -> F.is_function(@x)

  'array':
    before: -> @x = []
    run:    -> F.is_array(@x)
