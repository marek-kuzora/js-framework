#
# @require:
#   p: fest/performance/type
#


# Creating primitives.
p().group '/create.primitives',

  'boolean': -> r = true

  'integer': -> r = 101

  'float': -> r = 1.01

  'string': -> r = 'string'

  'regexp': -> r = /regexp/


# Creating primitives via object wrappers
p().group '/create.wrappers',

  'boolean': -> r = new Boolean(true)

  'integer': -> r = new Number(101)

  'float': -> r = new Number(1.01)

  'string': -> r = new String('string')

  'regexp': -> r = new RegExp('regexp')
