#
# @require:
#   tracker:  fierry/emitter/tracker 
#   Abstract: fierry/view_2/abstract
#



return class Parent extends Abstract

  constructor: (@type, @parent_, @behavior_, @nodes_fn_) ->
    @index_ = null
    @nodes_ = null

    @finalized_ = null
    @disposed_ = null


  execute: (@index_) ->
    tracker().push(@)
    @behavior_.create(@)

    if @nodes_fn_
      node.execute(i) for node, i in @nodes_ = @nodes_fn_(new Array())

    @behavior_.finalize(@)
    @finalized_ = true

    tracker().pop()
    return @


  dispose: ->
    return if @disposed_

    node.dispose() for node in @nodes_

    @behavior_.dispose(@)
    @disposed_ = true


  notify_change: ->
    return if @disposed_

    tracker().push(@)

    if @nodes_fn_
      node.dispose()  for node in @nodes_
      node.execute(i) for node, i in @nodes_ = @nodes_fn_(new Array())

    tracker().pop()
