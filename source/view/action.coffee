#
# @require:
#   array: fierry/util/array.
#
#   tracker: fierry/emitter/tracker
#



#
# Compares two Action instances.
#
COMPARE_FN = (a,b) -> a.uid - b.uid



return class Action

  #
  # Constructor for Action class. Instances of this class are
  # usually created inside array literal that is returned from
  # directly from a function. Because of that, creating an array
  # or function property inside the constructor will compromise
  # the object's initialization performance (by a factor of 2).
  #
  constructor: (@type, @uid, @parent, @behavior_, @value_fn_, @nodes_fn_) ->
    @value = null
    @nodes = null
    @finalized = false

  execute: ->
    tracker().start(@)

    @value = @value_fn_()
    @nodes = @nodes_fn_(new Array())

    @behavior_.create(@, @parent)
    @behavior_.update(@)

    node.execute() for node in @nodes

    @behavior_.finalize(@)

    tracker().stop()
    @finalized = true
    return @


  notify_change: ->
    return if @disposed

    tracker().start(@)
    @value = @value_fn_()

    @behavior_.update(@)

    [old_nodes, new_nodes] = @_get_changed_nodes()
    node.dispose() for node in old_nodes
    node.execute() for node in new_nodes

    tracker().stop()
    return


  _get_changed_nodes: ->
    old_nodes = []
    new_nodes = []

    a = 0
    b = 0
    arra = @nodes
    arrb = @nodes_fn_(new Array())
    
    while a < arra.length and b < arrb.length
      ua = arra[a].uid
      ub = arrb[b].uid

      if ua < ub
        old_nodes.push(arra[a])
        a++

      if ua > ub
        new_nodes.push(arrb[b])
        b++

      if ua is ub
        a++
        b++

    if a < arra.length
      old_nodes = old_nodes.concat(arra.slice(a))

    if b < arrb.length
      new_nodes = new_nodes.concat(arrb.slice(b))
    
    return [old_nodes, new_nodes]


  dispose: ->
    @parent.detach(@) if @parent && not @parent.disposed
    @disposed = true

    @behavior_.dispose(@)

    node.dispose() for node in @nodes
    @nodes = []


  attach: (node) ->
    array.insert_cst(@nodes, node, COMPARE_FN)


  detach: (child) ->
    array.remove(@nodes, child)


  # Looks like Array.prototype.filter!
  find: (fn) ->
    return fn(@nodes)
