#
# @require:
#   Value:    fierry/view_2/value
#   Parent:   fierry/view_2/parent
#   Behavior: fierry/view_2/behavior
#


class Behavior2
  create: ->
  finalize: ->
  dispose: ->


behavior1 = new Behavior()
behavior2 = new Behavior2()


performance '/view_2.siblings',

  before: ->
    nodes = (_) ->
      _.push new Parent(null, this, behavior2)
      _.push new Parent(null, this, behavior2)
      _.push new Parent(null, this, behavior2)
      _.push new Parent(null, this, behavior2)
      _.push new Parent(null, this, behavior2)
      _.push new Parent(null, this, behavior2)
      _.push new Parent(null, this, behavior2)
      _.push new Parent(null, this, behavior2)
      _.push new Parent(null, this, behavior2)
      _.push new Parent(null, this, behavior2)
      return _

    @view = (new Parent(null, null, behavior1, nodes)).execute()


  'first': -> @view.nodes_[0].next_sibling(Behavior)
  'second': -> @view.nodes_[4].next_sibling(Behavior)
  'last': -> @view.nodes_[9].next_sibling(Behavior)

