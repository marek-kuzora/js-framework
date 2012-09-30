#
# @require:
#   View:      fierry/view_3/view
#   Parent:    fierry/view_3/parent
#   Value:     fierry/view_3/value
#   If:        fierry/view_3/if
#
#   Root:      fierry/dom_2/root
#   Element:   fierry/dom_2/element
#   Attribute: fierry/dom_2/attribute
#



root      = new Root()
element   = new Element()
attribute = new Attribute()



nodes = (_) ->
  _.push new Parent(this, 'div', element, (_) ->
    _.push new Value(this, 'id', attribute, -> 'A')
    _.push new Value(this, 'title', attribute, -> 'Title')
    _.push new Value(this, 'lang', attribute, -> 'pl-PL')
    return _
  )
  return _


return new View(null, root, nodes)
