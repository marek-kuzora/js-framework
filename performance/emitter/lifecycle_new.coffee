#
# @require:
#   Emitter:  fierry/emitter_2/emitter
#
#   tracker:  fierry/emitter_2/tracker
#   notifier: fierry/emitter_2/notifier
#



performance '/emitter.lifecycle_new'
  before: ->
    @data = (new Emitter() for i in [0...EMITTERS])



performance '/emitter.lifecycle_new.static'



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



performance '/emitter.lifecycle_new.dynamic'



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


  underlying_data_changed: ->
    tracker().push(@)

    @data[i].fire_access() for i in @s
    @data[F.random(EMITTERS)].fire_access() for i in [0...@d]

    tracker().pop()


  track_data_access: (e) ->
    e.subscribe(@)



create = (s, d, data) ->
  listeners = (new Listener(s, d, data) for i in [0...LISTENERS])
  l.underlying_data_changed() for l in listeners

  return listeners



test = (count, data) ->
  data[F.random(EMITTERS)].fire_change() for i in [0...count]
  notifier().run()
