#
# @require:
#   tracker: fierry/emitter/tracker
#   Special: fierry/view_3/special
#



return class Group extends Special

  #
  # Constructs an action object. All of the object's properties are 
  # set to null in order to enforce a better type optimization in 
  # the V8 Engine.
  #
  # @param parent_    {Abstract}
  # @param nodes_fn_  {Function}
  #
  constructor: (@parent_, @nodes_fn_) ->

    # References to the previous & next siblings.
    @prev_ = null
    @next_ = null

    # Array of the action's child nodes.
    @nodes_ = null

    # Boolean flag indicating that the action is disposed.
    @disposed_ = null

    # Proper previous sibling of the action's next sibling.
    @last_node_ = null


  create: (@prev_, @next_)->

    # Start data access tracking.
    tracker().start(@)

    # If there were child nodes defined.
    if @nodes_fn_

      # Set initial prev & next siblings.
      prev = @
      next = @next_

      # Iterate through newly evaluated child nodes:
      for node in @nodes_ = @nodes_fn_(new Array)

        # Assign proper next sibling into the last executed node.
        prev.next_ = node if prev

        # Create child node with proper siblings.
        node.create(prev, next)

        # Set previous sibling as the last executed node.
        prev = node.last()

      # Set last node as the last executed node.
      @last_node_ = prev

    # Stop data access tracking.
    tracker().stop()


  notify: ->

    # Return if action is already disposed.
    return if @disposed_

    # Start data access tracking.
    tracker().start(@)

    # Dispose all existing child nodes.
    node.dispose() for node in @nodes_

    # If there were child nodes defined.
    if @nodes_fn_

      # Set initial prev & next siblings.
      prev = @
      next = @next_

      # Iterate through newly evaluated child nodes:
      for node in @nodes_ = @nodes_fn_(new Array)

        # Assign proper next sibling into the last executed node.
        prev.next_ = node if prev

        # Create child node with proper siblings.
        node.create(prev, next)

        # Set new prev sibling as the last executed node.
        prev = node

      # Set last node as the last executed node.
      @last_node_ = prev

    # Stop data access tracking.
    tracker().stop()


  dispose: ->

    # Return if action is already disposed.
    return if @disposed_

    # Dispose all existing nodes.
    if @nodes_fn_
      node.dispose() for node in @nodes_

    # Remove action from the siblings list.
    @prev_.next_ = @next_ if @prev_
    @next_.prev_ = @prev_ if @next_

    # Mark action as disposed.
    @disposed_ = true
