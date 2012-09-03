#
# @require:
#   Emitter:  fierry/emitter/emitter
#


performance '/emitter.trigger_change_'

  'continuous':
    before: -> @e = new Emitter()
    run:    -> @e.trigger_change_()

  'with subscribe':
    before: ->
      @e = new Emitter()
      @l = {}
    run: ->
      @e.trigger_change_()
      @e.register_listener(@l)
