#
# @require:
#   Abstract: fierry/view/abstract
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

    # Proper previous sibling of the action's next sibling.
    @last_node_ = null



  #
  # Indicates that the action is a special action.
  #
  is_special: ->
    return true


  #
  # Returns last node that was appended to the siblings list at 
  # the current level. This element will be the proper prev node 
  # when generating siblings list in Parent or Group actions.
  #
  last: ->
    return @last_node_
