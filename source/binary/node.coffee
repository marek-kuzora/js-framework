return class BNode

  constructor: (@key, @value, @parent) ->
    @left  = null
    @right = null


  add_node: (key, value) ->
    d = key - @key
    @left  = new BNode(key, value, @) if d < 0
    @right = new BNode(key, value, @) if d > 0
    return d isnt 0


  remove_node: (node) ->
    @left  = null if node is @left
    @right = null if node is @right


  replace_node: (node, repl) ->
    repl.parent = @
    
    @left  = repl if node is @left
    @right = repl if node is @right


  has_left_child: ->
    return @left isnt null and @right is null


  has_right_child: ->
    return @right isnt null and @left is null


  each: (fn) ->
    @left.each(fn) if @left
    fn(@value)
    @right.each(fn) if @right
