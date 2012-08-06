#
# @require:
#   Parent:  fierry/view_2/parent
#   Value:   fierry/view_2/value
#   If:      fierry/view_2/if
#
#   Element: fierry/dom_2/element
#   Attr:    fierry/dom_2/attribute
#   Root:    fierry/dom_2/root
#


root = new Root()
element = new Element()
attribute = new Attr()


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


