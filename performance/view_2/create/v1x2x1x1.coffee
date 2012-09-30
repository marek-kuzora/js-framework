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
  _.push new Parent(this, null, behavior, (_) ->
    _.push new Parent(this, null, behavior, (_) ->
      _.push new Value(this, null, behavior, -> 1)
      return _
    )
    return _
  )

  _.push new Parent(this, null, behavior, (_) ->
    _.push new Parent(this, null, behavior, (_) ->
      _.push new Value(this, null, behavior, -> 2)
      return _
    )
    return _
  )
  return _


return new View(null, behavior, nodes)
