#
# @require:
#   Action: fierry/view/action
#



return class View

  constructor: (@type_, @behavior_, @nodes_) ->


  run: (world, nodes_ = @nodes_) ->
    n = (arr) -> nodes_.call(@, world, arr)
    a = new Action(@type_, 0, null, @behavior_, (->), n)
    return a.execute()


  use: (world, parent) ->
    return @nodes_.call(parent, world, new Array())
