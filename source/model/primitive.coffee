#
# @require:
#   Emitter: fierry/emitter/emitter
#



return class Primitive extends Emitter

  constructor: (@value_) ->
    super()

  get: =>
    @trigger_access_()
    return @value_


  set: (value) =>
    @value_ = value
    @trigger_change_()
