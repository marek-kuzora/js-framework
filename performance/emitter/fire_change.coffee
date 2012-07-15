#
# @require:
#   Emitter:  fierry/emitter/emitter
#


performance '/emitter.fire_change'

  'continous':
    before: -> @e = new Emitter()
    run:    -> @e.fire_change()

  'with subscribe':
    before: ->
      @e = new Emitter()
      @l = {}
    run: ->
      @e.fire_change()
      @e.subscribe(@l)
