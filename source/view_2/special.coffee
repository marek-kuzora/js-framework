#
# @require:
#   Abstract: fierry/view_2/abstract
#



return class Special extends Abstract

  parent: ->
    return @parent_.parent()


  is_visible_: ->
    return false


  traverse_forward_: (b, t, idx) ->
    len = @nodes_.length

    while ++idx < len
      node = @nodes_[idx]

      if node.is_unprocessed_()
        return @parent_.traverse_forward_(b, t, @index_)

      if !node.is_visible_()
        return node.traverse_forward_(b, t, -1)

      if node.behavior_ instanceof b and (!t or node.type is t)
        return node

    return @parent_.traverse_forward_(b, t, @index_)


  traverse_backward_: (b, t, idx = @nodes_.length) ->
    while idx--
      node = @nodes_[idx]

      if node.is_unprocessed_()
        continue

      if !node.is_visible_()
        return node.traverse_backward_(b, t)

      if node.behavior_ instanceof b and (!t or node.type is t)
        return node

    return @parent_.traverse_backward_(b, t, @index_)
