#
# @require:
#   Abstract: fierry/view/abstract
#



return class Standard extends Abstract

  #
  # Constructs an action object. This method is for exemplary purpose
  # only - for performance reasons all subclasses need to define 
  # their own constructors without calling the superclass.
  #
  # @param parent_    {Abstract}
  # @param type_      {String}
  # @param behavior_  {Behavior}
  #
  constructor: (@parent_, @behavior_, @type_) ->

  
  type: ->
    return @type_


  behavior: ->
    return @behavior_


  #
  # Indicates that the action is a standard action.
  #
  is_special: ->
    return false


  #
  # Returns last node that was appended to the siblings list at 
  # the current level. This element will be the proper prev node 
  # when generating siblings list in Parent or Group actions.
  #
  last: ->
    return @


  #
  # Returns the action's previous sibling from the siblings list with 
  # the matching behavior and type.
  #
  # @param b  {Behavior}
  # @param t  {String?}
  #
  prev_sibling: (b, t) ->
    node = @

    while node = node.prev()

      if node.behavior() instanceof b and (!t or node.type() is t)
        return node

    return null


  #
  # Returns the action's next sibling from the siblings list with 
  # the matching behavior and type.
  #
  # @param b  {Behavior}
  # @param t  {String?}
  #
  next_sibling: (b, t) ->
    node = @

    while node = node.next()

      if node.behavior() instanceof b and (!t or node.type() is t)
        return node

    return null
