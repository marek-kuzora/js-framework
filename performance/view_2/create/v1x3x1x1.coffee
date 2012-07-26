#
# @require:
#   actions:  fierry/view_2/nodes.
#   Behavior: fierry/view_2/behavior
#


behavior = new Behavior()


nodes = (_) ->
  _.push new actions.Parent(null, this, behavior, (_) ->
    _.push new actions.Parent(null, this, behavior, (_) ->
      _.push new actions.Value(null, this, behavior, -> 1)
      return _
    )
    return _
  )

  _.push new actions.Parent(null, this, behavior, (_) ->
    _.push new actions.Parent(null, this, behavior, (_) ->
      _.push new actions.Value(null, this, behavior, -> 2)
      return _
    )
    return _
  )

  _.push new actions.Parent(null, this, behavior, (_) ->
    _.push new actions.Parent(null, this, behavior, (_) ->
      _.push new actions.Value(null, this, behavior, -> 3)
      return _
    )
    return _
  )
  return _


return ->
  return (new actions.Parent(null, null, behavior, nodes)).execute()
