#
# @require:
#   BNode: fierry/binary/node
#



return class BTree extends BNode

  constructor: (key, value) ->
    @key = key
    @value = value

    @maximum_ = key
    @minimum_ = key

    @left  = null
    @right = null


  add: (key, value) ->

    # Create root node if not defined.    
    if not @key
      @key = key
      @value = value

      @minimum_ = key
      @maximum_ = key
      return true

    # If found the matching parent node.
    if parent = @get_parent_node(key)
      parent.add_node(key, value)

      @minimum_ = key if key < @minimum_
      @maximum_ = key if key > @maximum_
      return true

    # Return false if key is duplicated.
    return false


  remove: (key) ->
    node = @get_node(key)

    if not node
      return false

    if node.left and node.right
      nearest = @get_nearest_node(node)
      @remove(nearest.key)

      node.key = nearest.key
      node.value = nearest.value

    else if node is @

      if not node.left and not node.right
        @set_root_node(undefined)

      else if node.has_left_child()
        @set_root_node(node.left)

      else if node.has_right_child()
        @set_root_node(node.right)

    else

      if not node.left and not node.right
        node.parent.remove_node(node)

      else if node.has_left_child()
        node.parent.replace_node(node, node.left)

      else if node.has_right_child()
        node.parent.replace_node(node, node.right)

    return true


  contains: (key) ->
    return @get_node(key) isnt null


  get_node: (key) ->
    node = @

    while node
      return node if key is node.key
      node = if key < node.key then node.left else node.right
    return null


  get_parent_node: (key) ->
    node = @
    parent = null

    while node
      return null if key is node.key
      
      parent = node
      node   = if key < node.key then node.left else node.right

    return parent


  get_nearest_node: (node) ->
    if F.random() > 0.5
      node = node.left
      node = node.right while node.right

    else
      node = node.right
      node = node.left while node.left

    return node


  set_root_node: (node) ->
    if not node
      @key = undefined
      @value = undefined

    else
      @key = node.key
      @value = node.value

      @left  = node.left
      @right = node.right

      @left?.parent  = @
      @right?.parent = @
