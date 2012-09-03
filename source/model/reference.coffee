#
# @require:
#   Emitter: fierry/emitter/emitter
#



return class Reference extends Emitter

  constructor: (@pointer_, @value_, @parent_) ->
    super()
    

  get: =>
    @trigger_access_()
    return @pointer_.call(@parent_.get(), @value_)()


  set: (value) =>
    @value_ = value
    @trigger_change_()
