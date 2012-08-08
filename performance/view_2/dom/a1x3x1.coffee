#
# @require:
#   Parent:    fierry/view_2/parent
#   Value:     fierry/view_2/value
#   If:        fierry/view_2/if
#
#   Root:      fierry/dom_2/root
#   Element:   fierry/dom_2/element
#   Attribute: fierry/dom_2/attribute
#



root      = new Root()
element   = new Element()
attribute = new Attribute()



nodes = (_) ->
  _.push new Parent('div', this, element, (_) ->
    _.push new Value('id', this, attribute, -> 'A')
    return _
  )
  _.push new Parent('div', this, element, (_) ->
    _.push new Value('id', this, attribute, -> 'B')
    return _
  )
  _.push new Parent('div', this, element, (_) ->
    _.push new Value('id', this, attribute, -> 'C')
    return _
  )
  return _


return ->
  return (new Parent(null, null, root, nodes)).execute()



