#
# @require:
#   Emitter: fierry/emitter/emitter
#



return class Data extends Emitter

  constructor: ->
    @value_ = null

  get: ->
    @trigger_access_()
    return @value_


  set: (@value_) =>
    @trigger_change_()
