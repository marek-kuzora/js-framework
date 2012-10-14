#
# @require:
#   tracker: fierry/emitter/tracker
#   Special: fierry/view/special
#   Group:   fierry/view/group
#



return class If extends Special

  constructor: (@parent_, @value_fn_, @tnodes_fn_, @fnodes_fn_) ->
    
    # References to the previous & next siblings.
    @prev_ = null
    @next_ = null

    # Value of the action's condition.
    @value_ = null

    # Reference to the group action matching the current condition.
    @group_ = null

    # Boolean flag indicating that the action is disposed.
    @disposed_ = null


  create: (@prev_, @next_) ->

    # Start data access tracking.
    tracker().start(@)

    # Calculate the current action's condition.
    @value_ = @value_fn_()

    # Create a group with its child nodes matching the current
    # condition. Inject the group after IF into the siblings list.
    @group_ = new Group(@, if @value_ then @tnodes_fn_ else @fnodes_fn_)
    @group_.create(@, @next_)

    # Set the next sibling to the internal group action.
    @next_ = @group_
    
    # Stop data access tracking.
    tracker().stop()


  notify: ->

    # Return if action is already disposed.
    return if @disposed_

    # Start data access tracking.
    tracker().start(@)

    # If the condition has changed.
    if @value_ ^ value = @value_fn_()

      # Update the current condition.
      @value_ = value

      # Dispose the group as its nodes no longer match the condition.
      @group_.dispose()

      # Create a group with its child nodes matching the current
      # condition. Inject the group after IF into the siblings list.
      @group_ = new Group(@, if @value_ then @tnodes_fn_ else @fnodes_fn_)
      @group_.create(@, @next_)

      # Set the next sibling to the internal group action.
      @next_ = @group_

    # Stop data access tracking.
    tracker().stop()


  dispose: ->
    
    # Return if action is already disposed.
    return if @disposed_

    # Dispose the group.
    @group_.dispose()

    # Remove action from the siblings list.
    @prev_.next_ = @next_ if @prev_
    @next_.prev_ = @prev_ if @next_

    # Mark action as disposed.
    @disposed_ = true


  #
  # Returns last node that was appended to the siblings list at 
  # the current level. This element will be the proper prev node 
  # when generating siblings list in Parent or Group actions.
  #
  last: ->
    return @group_.last_node_
