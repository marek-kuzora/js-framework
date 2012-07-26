#
# @require:
#   tracker: fierry/emitter/tracker
#



return class Value

  constructor: (@type, @parent_, @behavior_, @value_fn_) ->
    @value = null


  execute: ->
    tracker().push(@)

    if @value_fn_
      @value = @value_fn_()

    @behavior_.create(@)
    @behavior_.finalize(@)

    tracker().pop()
    return @


  set_index: (@index_) ->

