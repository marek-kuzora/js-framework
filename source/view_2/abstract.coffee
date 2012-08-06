return class Abstract

  parent: ->
    return @parent_


  is_unprocessed_: ->
    return @index_ is null


  is_visible_: ->
    return true


  notify_access: (e) ->
    e.subscribe(@)


  traverse_forward: (b, t) ->
    return @parent_.traverse_forward_(b, t, @index_)


  traverse_forward_: (b, t, idx) ->
    len = @nodes_.length

    while ++idx < len
      node = @nodes_[idx]

      if node.is_unprocessed_()
        return null

      if !node.is_visible_()
        return node.traverse_forward_(b, t, -1)

      if node.behavior_ instanceof b and (!t or node.type is t)
        return node

    return null


  traverse_backward: (b, t) ->
    return @parent_.traverse_backward_(b, t, @index_)


  traverse_backward_: (b, t, idx = @nodes_.length) ->
    while idx--
      node = @nodes_[idx]

      if node.is_unprocessed_()
        continue

      if !node.is_visible_()
        return node.traverse_backward_(b, t)

      if node.behavior_ instanceof b and (!t or node.type is t)
        return node

    return null
