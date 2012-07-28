#
# @require:
#   actions: fierry/view_2/nodes.
#   Element: fierry/dom_2/element
#   Root:    fierry/dom_2/root
#


root = new Root()
element = new Element()


nodes = (_) ->
  _.push new actions.Parent('div', this, element)
  _.push new actions.Parent('div', this, element)
  _.push new actions.Parent('div', this, element)
  return _


return ->
  return (new actions.Parent(null, null, root, nodes)).execute()

