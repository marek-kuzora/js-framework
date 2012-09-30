#
# @require:
#   View:     fierry/view_3/view
#   Parent:   fierry/view_3/parent
#   Value:    fierry/view_3/value
#   If:       fierry/view_3/if
#
#   Behavior: fierry/view_3/behavior
#


behavior = new Behavior()


nodes = (_, world) ->
  _.push new Parent(this, null, behavior, (_) ->
    _.push new If(this, (-> true), (_) ->
      _.push new Parent(this, null, behavior, (_) ->
        _.push new Parent(this, null, behavior)
        return _
      )
      return _
    )
    return _
  )
  return _


return new View(null, behavior, nodes)

