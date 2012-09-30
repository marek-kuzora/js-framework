#
# @require:
#   View:     fierry/view_3/view
#   Parent:   fierry/view_3/parent
#   Behavior: fierry/view_3/behavior
#


behavior = new Behavior()


nodes = (_, world) ->
  _.push new Parent(this, null, behavior, (_) ->
    _.push new Parent(this, null, behavior)
    return _
  )

  _.push new Parent(this, null, behavior, (_) ->
    _.push new Parent(this, null, behavior)
    return _
  )

  _.push new Parent(this, null, behavior, (_) ->
    _.push new Parent(this, null, behavior)
    return _
  )

  return _


return new View(null, behavior, nodes)
