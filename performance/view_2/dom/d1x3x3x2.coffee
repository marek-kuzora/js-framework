#
# @require:
#   Parent:  fierry/view_2/parent
#   Value:   fierry/view_2/value
#   If:      fierry/view_2/if
#
#   Element: fierry/dom_2/element
#   Root:    fierry/dom_2/root
#


root = new Root()
element = new Element()


nodes = (_) ->
  _.push new Parent('div', this, element, (_) ->
    _.push new Parent('article', this, element, (_) ->
      _.push new Parent('section', this, element)
      _.push new Parent('section', this, element)
      return _
    )
    _.push new Parent('article', this, element, (_) ->
      _.push new Parent('section', this, element)
      _.push new Parent('section', this, element)
      return _
    )
    _.push new Parent('article', this, element, (_) ->
      _.push new Parent('section', this, element)
      _.push new Parent('section', this, element)
      return _
    )
    return _
  )

  _.push new Parent('div', this, element, (_) ->
    _.push new Parent('article', this, element, (_) ->
      _.push new Parent('section', this, element)
      _.push new Parent('section', this, element)
      return _
    )
    _.push new Parent('article', this, element, (_) ->
      _.push new Parent('section', this, element)
      _.push new Parent('section', this, element)
      return _
    )
    _.push new Parent('article', this, element, (_) ->
      _.push new Parent('section', this, element)
      _.push new Parent('section', this, element)
      return _
    )
    return _
  )

  _.push new Parent('div', this, element, (_) ->
    _.push new Parent('article', this, element, (_) ->
      _.push new Parent('section', this, element)
      _.push new Parent('section', this, element)
      return _
    )
    _.push new Parent('article', this, element, (_) ->
      _.push new Parent('section', this, element)
      _.push new Parent('section', this, element)
      return _
    )
    _.push new Parent('article', this, element, (_) ->
      _.push new Parent('section', this, element)
      _.push new Parent('section', this, element)
      return _
    )
    return _
  )
  return _


return ->
  return (new Parent(null, null, root, nodes)).execute()


