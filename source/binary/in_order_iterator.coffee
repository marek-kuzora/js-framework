return class InOrderIterator

  constructor: (@array_) ->
    @i = 0
    @prev = null
    @node = null


  next: ->
    if not @node
      return @next_root_()

    if @node.right
      @node = @node.right
      @node = @node.left while @node.left
      return @node.value

    else
      loop
        @prev = @node
        @node = @node.parent

        if not @node
          return @next_root_()

        if @node.left is @prev
          return @node.value


  next_root_: ->
    if not @node = @array_[@i++]
      return undefined

    @node = @node.left while @node.left
    return @node.value
