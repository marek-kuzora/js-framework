#
# @require:
#   actions: fierry/view_2/nodes.
#   Element: fierry/dom_2/element
#   Attr:    fierry/dom_2/attribute_no_conflict
#   Root:    fierry/dom_2/root
#


root = new Root()
element = new Element()
attribute = new Attr()


nodes = (_) ->
  _.push new actions.Parent('div', this, element, (_) ->
    _.push new actions.Value('id', this, attribute, -> 'A')
    return _
  )
  _.push new actions.Parent('div', this, element, (_) ->
    _.push new actions.Value('id', this, attribute, -> 'B')
    return _
  )
  _.push new actions.Parent('div', this, element, (_) ->
    _.push new actions.Value('id', this, attribute, -> 'C')
    return _
  )
  return _


return ->
  return (new actions.Parent(null, null, root, nodes)).execute()



