return class PreOrderIterator

  constructor: (@array_) ->
    @i = 0
    @q = []


  next: ->
    @q.push(@array_[@i++]) if not @q.length

    return undefined if not n = @q.pop()
    
    @q.push(n.right) if n.right
    @q.push(n.left) if n.left

    return n.value
