#
# @require:
#   View:     fierry/view_3/view
#   Parent:   fierry/view_3/parent
#   If:       fierry/view_3/if
#
#   Behavior: fierry/view_3/behavior
#


behavior = new Behavior()


nodes = (_, world) ->
  c = -> true
  n = (_) -> _.push new Parent(this, null, behavior); return _

  _.push new Parent(this, null, behavior)
  _.push new Parent(this, null, behavior)
  _.push new Parent(this, null, behavior)
  _.push new Parent(this, null, behavior)
  _.push new Parent(this, null, behavior)
  _.push new Parent(this, null, behavior)
  _.push new Parent(this, null, behavior)
  _.push new Parent(this, null, behavior)
  _.push new If(this, c, n)
  return _


return new View(null, behavior, nodes)

