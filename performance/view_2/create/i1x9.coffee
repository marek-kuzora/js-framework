#
# @require:
#   actions:  fierry/view_2/nodes.
#   Behavior: fierry/view_2/behavior
#


behavior = new Behavior()


nodes = (_) ->
  c = -> true
  n = (_) -> _.push new actions.Parent(null, this, behavior); return _

  _.push new actions.Parent(null, this, behavior)
  _.push new actions.Parent(null, this, behavior)
  _.push new actions.Parent(null, this, behavior)
  _.push new actions.Parent(null, this, behavior)
  _.push new actions.Parent(null, this, behavior)
  _.push new actions.Parent(null, this, behavior)
  _.push new actions.Parent(null, this, behavior)
  _.push new actions.Parent(null, this, behavior)
  _.push new actions.If(this, c, n)
  return _


return ->
  return (new actions.Parent(null, null, behavior, nodes)).execute()

