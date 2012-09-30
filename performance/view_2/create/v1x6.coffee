#
# @require:
#   View:     fierry/view_3/view
#   Parent:   fierry/view_3/parent
#   Value:    fierry/view_3/value
#
#   Behavior: fierry/view_3/behavior
#


behavior = new Behavior()


nodes = (_, world) ->
  _.push new Value(this, null, behavior, -> 1)
  _.push new Value(this, null, behavior, -> 2)
  _.push new Value(this, null, behavior, -> 3)
  _.push new Value(this, null, behavior, -> 4)
  _.push new Value(this, null, behavior, -> 5)
  _.push new Value(this, null, behavior, -> 6)
  return _


return new View(null, behavior, nodes)
