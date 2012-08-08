#
# @require:
#   Parent:  fierry/view_2/parent
#   Value:   fierry/view_2/value
#   If:      fierry/view_2/if
#
#   Root:    fierry/dom_2/root
#   Style:   fierry/dom_2/style
#   Element: fierry/dom_2/element
#



root    = new Root()
style   = new Style()
element = new Element()



nodes = (_) ->
  _.push new Parent('div', this, element, (_) ->
    _.push new Value('color', this, style, -> 'red')
    _.push new Value('border', this, style, -> 'solid 1px gold')
    _.push new Value('background', this, style, -> 'gray')
    return _
  )
  return _


return ->
  return (new Parent(null, null, root, nodes)).execute()

