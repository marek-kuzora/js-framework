#
# @require:
#   Abstract: fierry/view_3/abstract
#



return class Special extends Abstract

  #
  # Constructs an action object. This method is for exemplary purpose
  # only - for performance reasons all subclasses need to define 
  # their own constructors without calling the superclass.
  #
  # @param parent_    {Abstract}
  #
  constructor: (@parent_) ->


  #
  # Indicates that the action is a special action.
  #
  is_special: ->
    return true
