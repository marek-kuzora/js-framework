#
# @require:
#   Emitter:  fierry/emitter/emitter
#



return class Primitive extends Emitter

  constructor: (@value_) ->


  get: =>
    @fire_access()
    return @value_


  set: (value) =>
    @value_ = value
    @fire_change()
