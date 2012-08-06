#
# @require:
#   tracker:  fierry/emitter/tracker
#   Abstract: fierry/view_2/abstract
#



return class Value extends Abstract

  constructor: (@type, @parent_, @behavior_, @value_fn_) ->
    @index_ = null
    @value = null
    @disposed_ = null


  execute: (@index_) ->
    tracker().push(@)
      
    @value = @value_fn_() if @value_fn_
    @behavior_.create(@)

    tracker().pop()
    return @


  dispose: ->
    return if @disposed_

    @behavior_.dispose(@)
    @disposed_ = true


  notify_change: ->
    return if @disposed_

    tracker().push(@)

    @value = @value_fn_() if @value_fn_
    
    @behavior_.dispose(@)
    @behavior_.create(@)

    tracker().pop()
