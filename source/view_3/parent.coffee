#
# @require:
#   tracker:  fierry/emitter/tracker
#   Standard: fierry/view_3/standard
#



return class Parent extends Standard

  #
  # Constructs an action object. All of the object's properties are 
  # set to null in order to enforce a better type optimization in 
  # the V8 Engine.
  #
  # @param parent_    {Abstract}
  # @param type_      {String}
  # @param behavior_  {Behavior}
  # @param nodes_fn_  {Function}
  #
  constructor: (@parent_, @type_, @behavior_, @nodes_fn_) ->

    # References to the previous & next siblings.
    @prev_ = null
    @next_ = null

    # Array of the action's child nodes.
    @nodes_ = null

    # Boolean flag indicating that the action is disposed.
    @disposed_ = null


  #
  # Creates action for the first time. This method will execute the
  # action according to its behavior, recursivelly create its child
  # nodes and build dependences upon all model entities accessed
  # during its invocation.
  #
  # @param prev_  {Abstract}
  # @param next_  {Abstract}
  #
  create: (@prev_, @next_) ->

    # Start data access tracking.
    tracker().start(@)

    # Execute create behavior before child nodes are created.
    @behavior_.create(@)

    # If there were child nodes defined.
    if @nodes_fn_

      # Set initial prev & next siblings to null.
      prev = next = null

      # Iterate through newly evaluated child nodes:
      for node in @nodes_ = @nodes_fn_(new Array)

        # Assign proper next sibling into the last executed node.
        prev.next_ = node if prev

        # Create child node with proper siblings.
        node.create(prev, next)

        # Set new prev sibling as the last executed node.
        prev = node.last()

    # Execute finalize behavior after child nodes are created.
    @behavior_.finalize(@)

    # Stop data access tracking.
    tracker().stop()


  #
  # Updates action whenever the underlying data has changed. This
  # method will recreate action's child nodes and build dependences
  # upon all model entities accessed during its invocation. 
  #
  # Please note that this method will return immediately if the action 
  # has been disposed already.
  #
  notify: ->

    # Return if action is already disposed.
    return if @disposed_

    # Start data access tracking.
    tracker().start(@)

    # Dispose all existing child nodes.
    node.dispose() for node in @nodes_

    # If there were child nodes defined.
    if @nodes_fn_

      # Set initial prev & next siblings to null.
      prev = next = null

      # Iterate through newly evaluated child nodes:
      for node in @nodes_ = @nodes_fn_(new Array)

        # Assign proper next sibling into the last executed node.
        prev.next_ = node if prev

        # Create child node with proper siblings.
        node.create(prev, next)

        # Set new prev sibling as the last executed node.
        prev = node

    # Stop data access tracking.
    tracker().stop()


  #
  # Disposes action when it is no longer used. This method will
  # dispose the action's child nodes, clean-up the action according 
  # to its behavior and remove the action from the siblings list. 
  # The data access tracking won't be enabled, so any access to
  # the model entities will go unnoticed.
  #  
  # It is important to understand that, for now, the child nodes are
  # disposed in the ascending order. Resulting code is simplier and
  # there is no use case indicating that behaviors would benefit 
  # from introducing a descending-ordered loop.
  #
  # Please note that this method will return immediately if the action 
  # has already been disposed.
  #
  dispose: ->

    # Return if action is already disposed.
    return if @disposed_

    # Dispose all existing nodes.
    if @nodes_fn_
      node.dispose() for node in @nodes_

    # Execute dispose behavior after child nodes are disposed.
    @behavior_.dispose(@)

    # Remove action from the siblings list.
    @prev_.next_ = @next_ if @prev_
    @next_.prev_ = @prev_ if @next_

    # Mark action as disposed.
    @disposed_ = true
