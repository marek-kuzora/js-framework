#
# @require:
#   tracker: fierry/emitter/tracker
#   Special: fierry/view/special
#   Group:   fierry/view/group   
#



return class Model extends Special

  constructor: (@parent_, @value_, @nodes_fn_) ->

    # References to the previous & next siblings.
    @prev_ = null
    @next_ = null

    # Array of the action's child nodes.
    @nodes_ = null

    # Boolean flag indicating that the action is disposed.
    @disposed_ = null


  create: (@prev_, @next_) ->

    # Register to emitter to be notified if anything changes.
    @value_.register_listener(@)

    # Set nodes as an empty array.
    @nodes_ = new Array()

    # Set initial prev & next siblings.
    prev = @
    next = @next_

    # Create local reference to nodes_fn_.
    nodes_fn_ = @nodes_fn_

    # For each item in the @value_ array:
    for idx in [0...@value_.length()]

      # Retrieve the item from the model array.
      v = @value_.get(idx)

      # Create a group with its child nodes receiving additional loop
      # argument. Inject the group after FOR into the siblings list.
      node = new Group(@, (_) -> nodes_fn_(_, v))
      node.create(prev, next)

      # Insert group as the FOR's child node.
      @nodes_.push(node)

      # Set new prev sibling as the last executed node.
      prev = node

    return


  notify: ->

    # Processing new/old/ignore!


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
