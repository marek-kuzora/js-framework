#
# @require:
#   View:    fierry/view_3/view
#   Parent:  fierry/view_3/parent
#   Value:   fierry/view_3/value
#   If:      fierry/view_3/if
#
#   Element: fierry/dom_2/element
#   Root:    fierry/dom_2/root
#


root = new Root()
element = new Element()


nodes = (_) ->
  _.push new Parent(this, 'div', element, (_) ->
    _.push new Parent(this, 'article', element, (_) ->
      _.push new Parent(this, 'section', element)
      _.push new Parent(this, 'section', element)
      return _
    )
    _.push new Parent(this, 'article', element, (_) ->
      _.push new Parent(this, 'section', element)
      _.push new Parent(this, 'section', element)
      return _
    )
    _.push new Parent(this, 'article', element, (_) ->
      _.push new Parent(this, 'section', element)
      _.push new Parent(this, 'section', element)
      return _
    )
    return _
  )

  _.push new Parent(this, 'div', element, (_) ->
    _.push new Parent(this, 'article', element, (_) ->
      _.push new Parent(this, 'section', element)
      _.push new Parent(this, 'section', element)
      return _
    )
    _.push new Parent(this, 'article', element, (_) ->
      _.push new Parent(this, 'section', element)
      _.push new Parent(this, 'section', element)
      return _
    )
    _.push new Parent(this, 'article', element, (_) ->
      _.push new Parent(this, 'section', element)
      _.push new Parent(this, 'section', element)
      return _
    )
    return _
  )

  _.push new Parent(this, 'div', element, (_) ->
    _.push new Parent(this, 'article', element, (_) ->
      _.push new Parent(this, 'section', element)
      _.push new Parent(this, 'section', element)
      return _
    )
    _.push new Parent(this, 'article', element, (_) ->
      _.push new Parent(this, 'section', element)
      _.push new Parent(this, 'section', element)
      return _
    )
    _.push new Parent(this, 'article', element, (_) ->
      _.push new Parent(this, 'section', element)
      _.push new Parent(this, 'section', element)
      return _
    )
    return _
  )
  return _


return new View(null, root, nodes)
