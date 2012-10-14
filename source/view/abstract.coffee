return class Abstract

  #
  # Constructs an action object. This method is for exemplary purpose
  # only - for performance reasons all subclasses need to define 
  # their own constructors without calling the superclass.
  #
  # Subclasses are expected to redefine the Abstract constructor's
  # properties in order to achieve a better type optimization in 
  # the V8 Engine.
  #
  # @param parent_    {Abstract}
  #
  constructor: (@parent_) ->

    # References to the previous & next siblings.
    @prev_ = null
    @next_ = null

    # Boolean flag indicating that the action is disposed.
    @disposed_ = null


  #
  # Returns immediate standard parent.
  #
  parent: ->
    node = @parent_
    node = node.parent_ while node and node.is_special()

    return node


  #
  # Returns standard previous sibling from the siblings list.
  #
  prev: ->
    node = @prev_
    node = node.prev_ while node and node.is_special()

    return node


  #
  # Returns standard next sibling from the siblings list.
  #
  next: ->
    node = @next_
    node = node.next_ while node and node.is_special()

    return node


  #
  # Creates action for the first time. It is expected that the action 
  # will be fully initialized along with all of its child nodes 
  # and dependences to relevant model entities.
  #
  # Will throw an 'Unsupported operation' error when invoked directly
  # on the Abstract instance.
  #
  # @param prev_  {Abstract}
  # @param next_  {Abstract}
  #
  create: (@prev_, @next_) ->
    throw new Error 'Unsupported operation'


  #
  # Updates action whenever the underlying data has changed. It is
  # expected that after executing this method the action will be fully
  # refreshed along with all of its child nodes and the dependences to
  # relevant model entities.
  #
  # Will throw an 'Unsupported operation' error when invoked directly
  # on the Abstract instance.
  #
  notify: ->
    throw new Error 'Unsupported operation'


  #
  # Disposes action when it is no longer used. It is expected that 
  # the action will be disposed along with its child nodes and will
  # block any subsequent trials to dispose the disposed action again.
  #
  # Will throw an 'Unsupported operation' error when invoked directly
  # on the Abstract instance.
  #
  dispose: ->
    throw new Error 'Unsupported operation'
