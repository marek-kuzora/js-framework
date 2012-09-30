#
# @require:
#   tracker:   fierry/emitter/tracker
#   Emitter:   fierry/emitter/emitter
#
#   Special:   fierry/view_3/special
#   Model:     fierry/view_3/model_for
#   Primitive: fierry/view_3/primitive_for
#



return class For extends Special

  constructor: (@parent_, @value_fn_, @nodes_fn_) ->

    # References to the previous & next siblings.
    @prev_ = null
    @next_ = null

    # Value of the action's array.
    @value_ = null

    # Reference to the inner FOR action.
    @inner_ = null

    # Boolean flag indicating that the action is disposed.
    @disposed_ = null


  create: (@prev_, @next_) ->

    # Start data access tracking.
    tracker().start(@)

    # Calculate the current action's array.
    @value_ = @value_fn_()

    # Create the inner action based on the value's type. Inject it
    # after outer FOR into the siblings list.
    @inner_ = @create_inner_for_()
    @inner_.create(@, @next_)

    # Set the next sibling to the inner FOR action.
    @next_ = @inner_

    # Stop data access tracking.
    tracker().stop()


  notify: ->

    # Return if action is already disposed.
    return if @disposed_

    # Start data access tracking.
    tracker().start(@)

    # Dispose the inner FOR action.
    @inner_.dispose()

    # Calculate the current action's array.
    @value_ = @value_fn_()

    # Create the inner FOR action based on the value's type. 
    # Inject it after outer FOR into the siblings list.
    @inner_ = @create_inner_for_()
    @inner_.create(@, @next_)

    # Set the next sibling to the inner FOR action.
    @next_ = @inner_

    # Stop data access tracking.
    tracker().stop()


  dispose: ->

    # Return if action is already disposed.
    return if @disposed_

    # Dispose the inner FOR action.
    @inner_.dispose()

    # Remove action from the siblings list.
    @prev_.next_ = @next_ if @prev_
    @next_.prev_ = @prev_ if @next_

    # Mark action as disposed.
    @disposed_ = true


  create_inner_for_: ->
    return new Model(@, @value_, @nodes_fn_) if @value_ instanceof Emitter
    return new Primitive(@, @value_, @nodes_fn_)


  #
  # Returns last node that was appended to the siblings list at 
  # the current level. This element will be the proper prev node 
  # when generating siblings list in Parent or Group actions.
  #
  last: ->
    return @inner_.last()
