#
# @require:
#   action:   fierry/view_2/nodes.
#   Behavior: fierry/view_2/behavior
#


behavior1 = new Behavior()
behavior2 = create: (->), finalize: (->), dispose: (->)


nodes = (_) ->
  _.push new action.Parent(null, this, behavior2)
  _.push new action.Parent(null, this, behavior2)
  _.push new action.Parent(null, this, behavior2)
  _.push new action.Parent(null, this, behavior2)
  _.push new action.Parent(null, this, behavior2)
  _.push new action.Parent(null, this, behavior2)
  _.push new action.Parent(null, this, behavior2)
  _.push new action.Parent(null, this, behavior2)
  _.push new action.Parent(null, this, behavior2)
  _.push new action.Parent(null, this, behavior2)
  return _


return ->
  return (new action.Parent(null, null, behavior1, nodes)).execute()

