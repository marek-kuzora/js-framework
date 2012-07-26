#
# @require:
#   Value:    fierry/view_2/value
#   Parent:   fierry/view_2/parent
#   Behavior: fierry/view_2/behavior
#


behavior = new Behavior()


nodes = (_) ->
  _.push new Value(null, this, behavior, -> 1)
  _.push new Value(null, this, behavior, -> 2)
  _.push new Value(null, this, behavior, -> 3)
  _.push new Value(null, this, behavior, -> 4)
  _.push new Value(null, this, behavior, -> 5)
  _.push new Value(null, this, behavior, -> 6)
  return _


return ->
  return (new Parent(null, null, behavior, nodes)).execute()
