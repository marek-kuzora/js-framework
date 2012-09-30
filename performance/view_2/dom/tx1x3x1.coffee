#
# @require:
#   View:    fierry/view_3/view
#   Parent:  fierry/view_3/parent
#   Value:   fierry/view_3/value
#
#   Element: fierry/dom_2/element
#   Text:    fierry/dom_2/text
#   Root:    fierry/dom_2/root
#


root = new Root()
text = new Text()
element = new Element()


nodes = (_) ->
  _.push new Parent(this, 'div', element, (_) ->
    _.push new Value(this, 'text', text, -> 'hello')
    return _
  )
  _.push new Parent(this, 'div', element, (_) ->
    _.push new Value(this, 'text', text, -> 'world')
    return _
  )
  _.push new Parent(this, 'div', element, (_) ->
    _.push new Value(this, 'text', text, -> 'etc')
    return _
  )
  return _


return new View(null, root, nodes)
