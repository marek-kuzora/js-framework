#
# @require:
#   View:    fierry/view_3/view
#   Parent:  fierry/view_3/parent
#   Value:  fierry/view_3/value
#
#   Element: fierry/dom_2/element
#   Root:    fierry/dom_2/root
#   Tag:     fierry/dom_2/tag_2
#


tag = new Tag()
root = new Root()
element = new Element()


nodes = (_) ->
  _.push new Parent(this, 'div', element, (_) ->
    _.push new Value(this, 'tag', tag, -> 'header')
  )
  _.push new Parent(this, 'div', element, (_) ->
    _.push new Value(this, 'tag', tag, -> 'content')
  )
  _.push new Parent(this, 'div', element, (_) ->
    _.push new Value(this, 'tag', tag, -> 'footer')
  )
  return _


return new View(null, root, nodes)

