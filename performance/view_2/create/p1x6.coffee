#
# @require:
#   Parent:   fierry/view_2/parent
#   Behavior: fierry/view_2/behavior
#


behavior = new Behavior()


nodes = (_) ->
  _.push new Parent(null, this, behavior)
  _.push new Parent(null, this, behavior)
  _.push new Parent(null, this, behavior)
  _.push new Parent(null, this, behavior)
  _.push new Parent(null, this, behavior)
  _.push new Parent(null, this, behavior)
  return _


return ->
  return (new Parent(null, null, behavior, nodes)).execute()
