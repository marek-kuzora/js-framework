#
# @require:
#   View:    fierry/view_3/view
#   Parent:  fierry/view_3/parent
#   Value:   fierry/view_3/value
#   If:      fierry/view_3/if
#
#   Root:    fierry/dom_2/root
#   Style:   fierry/dom_2/style
#   Element: fierry/dom_2/element
#



root    = new Root()
style   = new Style()
element = new Element()



nodes = (_) ->
  _.push new Parent(this, 'div', element, (_) ->
    _.push new Value(this, 'color', style, -> 'red')
    _.push new Value(this, 'border', style, -> 'solid 1px gold')
    _.push new Value(this, 'background', style, -> 'gray')
    return _
  )
  return _


return new View(null, root, nodes)
