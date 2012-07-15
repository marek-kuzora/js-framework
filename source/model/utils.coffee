#
# @require:
#   constants: fierry/model/constants.
#
#   Accessor:  fierry/model/accessor
#



# Prefixes for generating getter & setter methods.
GET_PREFIX = 'get_'
SET_PREFIX = 'set_'



return self =

  #
  # Returns a reference function tagged with appropriate label.
  #
  # @param type  {(*) -> Accessor}
  # @return      {(*) -> Accessor}
  #
  ref: (type) ->
    return F.tag(constants.REFERENCE, type)


  #
  # Returns a model class definition tagged with appropriate label. 
  # The given type will be assigned ENHANCE() method if not present,
  # and getter & setter methods for aliases will be generated as
  # defined in the type::aliases property.
  #
  # @param type  {Class}
  # @return      {Class}
  #
  model: (type) ->
    type.ENHANCE ?= (v) -> v
    return F.tag(constants.MODEL, type)


  #
  # Returns an accessor modeling the world instance.
  #
  # @param type   {Class}
  # @param value  {*}      = {}
  #
  world: (type, value) ->
    acc = new Accessor(type, value, null, null)
    acc.get.set = acc.set
    
    return acc.get
