#
# @require:
#   tracker:  fierry/emitter/tracker
#   Standard: fierry/view_3/standard
#



return class Value extends Standard

  constructor: (@parent_, @type_, @behavior_, @value_fn_) ->

    # References to the previous & next siblings.
    @prev_ = null
    @next_ = null

    # Value of the action.
    @value_ = null

    # Boolean flag indicating that the action is disposed.
    @disposed_ = null

  
  value: ->
    return @value_


  create: (@prev_, @next_) ->

    # Start data access tracking.
    tracker().start(@)

    # Calculate the current action's value if defined.
    if @value_fn_
      @value_ = @value_fn_()

    # Execute action's create behavior.
    @behavior_.create(@)

    # Stop data access tracking.
    tracker().stop()


  notify: ->

    # Return if action is already disposed.
    return if @disposed_

    # Start data access tracking.
    tracker().start(@)

    # Execute action's dispose behavior.
    @behavior_.dispose(@)

    # Calculate the value if it's evaluation function is defined.
    if @value_fn_
      @value_ = @value_fn_()

    # Execute action's create behavior.
    @behavior_.create(@)

    # Stop data access tracking.
    tracker().stop()


  dispose: ->
    
    # Return if action is already disposed.
    return if @disposed_

    # Execute action's dispose behavior.
    @behavior_.dispose(@)

    # Remove action from the siblings list.
    @prev_.next_ = @next_
    @next_.prev_ = @prev_

    # Mark action as disposed.
    @disposed_ = true
