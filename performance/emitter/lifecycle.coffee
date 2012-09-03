#
# @require:
#   Emitter:  fierry/emitter/emitter
#
#   tracker:  fierry/emitter/tracker
#   notifier: fierry/emitter/notifier
#



performance '/emitter.lifecycle'
  before: ->
    @data = (new Emitter() for i in [0...EMITTERS])



performance '/emitter.lifecycle.static'



performance '1 emitter changed'

  '1 subscribe':
    before: -> @listeners = create(1, 0, @data)
    run:   -> test(1, @data)

  '3 subscribes':
    before: -> @listeners = create(3, 0, @data)
    run:   -> test(1, @data)

  '5 subscribes':
    before: -> @listeners = create(5, 0, @data)
    run:   -> test(1, @data)



performance '3 emitter changed'

  '1 subscribe':
    before: -> @listeners = create(1, 0, @data)
    run:   -> test(3, @data)

  '3 subscribes':
    before: -> @listeners = create(3, 0, @data)
    run:   -> test(3, @data)

  '5 subscribes':
    before: -> @listeners = create(5, 0, @data)
    run:   -> test(3, @data)



performance '5 emitter changed'

  '1 subscribe':
    before: -> @listeners = create(1, 0, @data)
    run:   -> test(5, @data)

  '3 subscribes':
    before: -> @listeners = create(3, 0, @data)
    run:   -> test(5, @data)

  '5 subscribes':
    before: -> @listeners = create(5, 0, @data)
    run:   -> test(5, @data)



performance '/emitter.lifecycle.dynamic'



performance '1 emitter changed'

  '1 subscribe':
    before: -> @listeners = create(0, 1, @data)
    run:   -> test(1, @data)

  '3 subscribes':
    before: -> @listeners = create(0, 3, @data)
    run:   -> test(1, @data)

  '5 subscribes':
    before: -> @listeners = create(0, 5, @data)
    run:   -> test(1, @data)



performance '3 emitter changed'

  '1 subscribe':
    before: -> @listeners = create(0, 1, @data)
    run:   -> test(3, @data)

  '3 subscribes':
    before: -> @listeners = create(0, 3, @data)
    run:   -> test(3, @data)

  '5 subscribes':
    before: -> @listeners = create(0, 5, @data)
    run:   -> test(3, @data)



performance '5 emitter changed'

  '1 subscribe':
    before: -> @listeners = create(0, 1, @data)
    run:   -> test(5, @data)

  '3 subscribes':
    before: -> @listeners = create(0, 3, @data)
    run:   -> test(5, @data)

  '5 subscribes':
    before: -> @listeners = create(0, 5, @data)
    run:   -> test(5, @data)



LISTENERS = 5
EMITTERS = 20



class Listener

  constructor: (s, @d, @data) ->
    @s = (F.random(EMITTERS) for i in [0...s])


  notify: ->
    tracker().start(@)

    @data[i].trigger_access_() for i in @s
    @data[F.random(EMITTERS)].trigger_access_() for i in [0...@d]

    tracker().stop()



create = (s, d, data) ->
  listeners = (new Listener(s, d, data) for i in [0...LISTENERS])
  l.notify() for l in listeners

  return listeners



test = (count, data) ->
  data[F.random(EMITTERS)].trigger_change_() for i in [0...count]
  notifier().run()
