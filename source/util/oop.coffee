#
# Module providing functionality for object oriented behaviour:
# classes, mixins handling, etc.
#
return oop =

  #
  # Installs the given properties into object as its own properties.
  # Common pattern to promote key functionality and save unnecessary
  # keystrokes.
  #
  # @example Array() and Array.isArray()
  #
  # @param object      {Object}
  # @param properties  {Object}
  #
  install: (object, properties) ->
    object[k] = v for k,v of properties
    return object
