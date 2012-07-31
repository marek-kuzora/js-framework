#
# @require:
#   actions:  fierry/view_2/nodes.
#   Behavior: fierry/view_2/behavior
#


behavior = new Behavior()


nodes = (_) ->
  _.push new actions.Parent(null, this, behavior)
  _.push new actions.Parent(null, this, behavior)
  _.push new actions.If(this, (-> true), (_) ->
    _.push new actions.Parent(null, this, behavior)
    return _
  )
  return _


return ->
  return (new actions.Parent(null, null, behavior, nodes)).execute()

