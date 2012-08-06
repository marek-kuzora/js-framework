#
# @require:
#   tracker: fierry/emitter/tracker
#   Special: fierry/view_2/special
#


return class Group extends Special

  constructor: (@parent_, @nodes_fn_) ->
    @index_ = null
    @nodes_ = null

    @finalized_ = null
    @disposed_ = null


  execute: (@index_) ->
    tracker().push(@)

    if @nodes_fn_
      for node, i in @nodes_ = @nodes_fn_(new Array())
        node.execute(i)

    @finalized_ = true
    tracker().pop()
    return @


  dispose: ->
    return if @disposed_

    node.dispose() for node in @nodes_
    @disposed_ = true


  notify_change: ->
    return if @disposed_

    tracker().push(@)

    if @nodes_fn_
      node.dispose()  for node in @nodes_
      node.execute(i) for node, i in @nodes_ = @nodes_fn_(new Array())

    tracker().pop()
