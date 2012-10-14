#
# @require:
#   tracker: fierry/emitter/tracker
#   Special: fierry/view_3/special
#   Group:   fierry/view_3/group   
#



return class Primitive extends Special

  constructor: (@parent_, @value_, @nodes_fn_) ->

    # References to the previous & next siblings.
    @prev_ = null
    @next_ = null

    # Array of the action's child nodes.
    @nodes_ = null

    # Boolean flag indicating that the action is disposed.
    @disposed_ = null

    # Proper previous sibling of the action's next sibling.
    @last_node_ = null


  create: (@prev_, @next_) ->

    # Set nodes as an empty array.
    @nodes_ = new Array()

    # Set initial prev & next siblings.
    prev = @
    next = @next_

    # Create local reference to nodes_fn_.
    nodes_fn_ = @nodes_fn_

    # For each item in the @value_ array:
    for v in @value_

      # Create a group with its child nodes receiving additional loop
      # argument. Inject the group after FOR into the siblings list.

      # Could get wrong v after all!
      node = new Group(@, (_) -> nodes_fn_.call(@, _, v))
      node.create(prev, next)

      # Insert group as the FOR's child node.
      @nodes_.push(node)

      # Set new prev sibling as the last executed node.
      prev = node.last()

    # Set last node as the last executed node.
    @last_node_ = prev

    return


  notify: ->

    # We do not expect the primitive FOR to ever be refreshed!
    throw new Error 'Unsupported operation'


  dispose: ->

    # Return if action is already disposed.
    return if @disposed_

    # Dispose all existing nodes.
    node.dispose() for node in @nodes_

    # Remove action from the siblings list.
    @prev_.next_ = @next_ if @prev_
    @next_.prev_ = @prev_ if @next_

    # Mark action as disposed.
    @disposed_ = true
