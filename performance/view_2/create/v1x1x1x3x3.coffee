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

      _.push new Parent(this, null, behavior, (_) ->
        _.push new Value(this, null, behavior, -> 1)
        _.push new Value(this, null, behavior, -> 2)
        _.push new Value(this, null, behavior, -> 3)
        return _
      )

      _.push new Parent(this, null, behavior, (_) ->
        _.push new Value(this, null, behavior, -> 4)
        _.push new Value(this, null, behavior, -> 5)
        _.push new Value(this, null, behavior, -> 6)
        return _
      )

      _.push new Parent(this, null, behavior, (_) ->
        _.push new Value(this, null, behavior, -> 7)
        _.push new Value(this, null, behavior, -> 8)
        _.push new Value(this, null, behavior, -> 9)
        return _
      )
      return _
    )
    return _
  )
  return _


return new View(null, behavior, nodes)
