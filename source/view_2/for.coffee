#
# @require:
#   tracker: fierry/emitter/tracker
#   Special: fierry/view_2/special
#



return class For extends Special

  constructor: (@parent_, @value_fn_, @nodes_fn_) ->
    @index_ = null
    @nodes_ = null


  execute: (@index_) ->
