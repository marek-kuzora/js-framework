#
# @require:
#   View:     fierry/view_3/view
#   Parent:   fierry/view_3/parent
#   For:      fierry/view_3/for
#
#   Behavior: fierry/view_3/behavior
#


behavior = new Behavior()


nodes = (_, world) ->
  _.push new For(this, world, (_, v) ->
    _.push new Parent(this, null, behavior, (_) ->
      _.push new Parent(this, null, behavior)
      return _
    )
    return _
  )
  return _


return ->
  return new View(null, behavior, nodes)

