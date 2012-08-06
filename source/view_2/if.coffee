#
# @require:
#   tracker: fierry/emitter/tracker
#
#   Group:   fierry/view_2/group
#   Special: fierry/view_2/special
#



return class If extends Special

  constructor: (@parent_, @value_fn_, @tnodes_fn_, @fnodes_fn_) ->
    @index_ = null
    @value_ = null
    @nodes_ = null

    @finalized_ = null
    @disposed_ = null


  execute: (@index_) ->
    tracker().push(@)

    @value_ = @value_fn_()
    @nodes_ = [new Group(@, (if @value_ then @tnodes_fn_ else @fnodes_fn_))]
    @nodes_[0].execute(0)

    @finalized_ = true
    tracker().pop()
    return @


  dispose: ->
    return if @disposed_

    @nodes_[0].dispose()
    @disposed_ = true
  

  notify_change: ->
    return if @disposed_

    tracker().push(@)
    value = @value_fn_()

    # If the true/false condition changed
    if (@value_ and !value) or (!@value_ and value)
      @nodes_[0].dispose()

      @value_ = value
      @nodes_ = [new Group(@, (if @value_ then @tnodes_fn_ else @fnodes_fn_))]
      @nodes_[0].execute(0)

    tracker().pop()
