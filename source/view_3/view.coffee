#
# @require:
#   Parent: fierry/view_3/parent
#



return class View

  constructor: (@type_, @behavior_, @nodes_fn_) ->


  run: (world) ->
    nodes_raw = @nodes_fn_
    nodes_fn  = (_) -> nodes_raw.call(@, _, world)

    action = new Parent(null, @type_, @behavior_, nodes_fn)
    action.create()

    return action


  use: (_, parent, world) ->
    @nodes_fn_.call(parent, _, world)
