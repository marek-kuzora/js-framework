#
# @require:
#   Parent: fierry/view_3/parent
#



return class View

  constructor: (@type_, @behavior_, @nodes_fn_) ->


  run: (world) ->
    nodes_fn_ = @nodes_fn_

    action = new Parent(null, @type_, @behavior_, (_) -> nodes_fn_(_, world))
    action.create()

    return action


  use: (_, parent, world) ->
    @nodes_fn_.call(parent, _, world)
