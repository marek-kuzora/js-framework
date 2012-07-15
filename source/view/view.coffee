#
# @require:
#   nodes:  fierry/view/nodes.
#   Action: fierry/view/action
#



return class View

  constructor: (@type_, @behavior_, @nodes_) ->


  run: (world, nodes_ = @nodes_) ->
    n = -> nodes_.call(@, world)
    a = new Action(@type_, 0, null, @behavior_, (->), n)
    return nodes.execute(a)


  use: (world, parent) ->
    return @nodes_.call(parent, world)
