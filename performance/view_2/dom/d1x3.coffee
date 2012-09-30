#
# @require:
#   View:    fierry/view_3/view
#   Parent:  fierry/view_3/parent
#
#   Element: fierry/dom_2/element
#   Root:    fierry/dom_2/root
#


root = new Root()
element = new Element()


nodes = (_) ->
  _.push new Parent(this, 'div', element)
  _.push new Parent(this, 'div', element)
  _.push new Parent(this, 'div', element)
  return _


return new View(null, root, nodes)
