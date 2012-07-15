# Creating primitives.
performance '/primitives.create'



performance 'natives'

  'string': -> 'string'

  'boolean': -> true

  'integer': -> 101

  'float':   -> 1.01

  'regexp':  -> /regexp/



# Creating primitives via object wrappers.
performance 'wrappers'

  'string': -> new String('string')

  'boolean': -> new Boolean(true)

  'integer': -> new Number(101)

  'float': -> new Number(1.01)

  'regexp': -> new RegExp('regexp')
