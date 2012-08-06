#
# @require:
#   Parent:   fierry/view_2/parent
#   Value:    fierry/view_2/value
#   If:       fierry/view_2/if
#
#   Behavior: fierry/view_2/behavior
#


behavior = new Behavior()


nodes = (_) ->
  _.push new Parent(null, this, behavior, (_) ->
    _.push new Parent(null, this, behavior, (_) ->
      _.push new Parent(null, this, behavior)
      return _
    )
    return _
  )

  _.push new Parent(null, this, behavior, (_) ->
    _.push new Parent(null, this, behavior, (_) ->
      _.push new Parent(null, this, behavior)
      return _
    )
    return _
  )
  return _


return ->
  return (new Parent(null, null, behavior, nodes)).execute()
