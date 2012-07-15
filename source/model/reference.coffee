#
# @require:
#   tracker:   fierry/model/tracker
#   notifier:  fierry/model/notifier
#
#   Emitter: fierry/emitter/emitter
#


return class Reference extends Emitter

  constructor: (@pointer_, @value_, @parent_) ->
    

  get: =>
    @fire_access()
    return @pointer_.call(@parent_.get(), @value_)()


  set: (value) =>
    @value_ = value
    @fire_change()
