#
# Creating primitives.
#
lightspeed '/create.primitives'

  'string': (i) ->
    r = 'string' while i--
    return


  'boolean': (i) ->
    r = true while i--
    return


  'integer': (i) ->
    r = 101 while i--
    return


  'float': (i) ->
    r = 1.01 while i--
    return


  'regexp': (i) ->
    r = /regexp/ while i--
    return


  'function': (i) ->
    r = (->) while i--
    return



#
# Creating primitives via object wrappers
#
lightspeed '/create.wrappers'

  'string': (i) ->
    r = new String('string') while i--
    return


  'boolean': (i) ->
    r = new Boolean(true) while i--
    return


  'integer': (i) ->
    r = new Number(101) while i--
    return


  'float': (i) ->
    r = new Number(1.01) while i--
    return


  'regexp': (i) ->
    r = new RegExp('regexp') while i--
    return
