#
# @require:
#   Emitter:    fierry/emitter/emitter
#   Subscriber: fierry/emitter/subscriber
#


test = (subscr, array, statics, dynamics) ->
  subscr.start_tracking()

  array[i].fire_access() for i in [0...statics]
  array[F.random(50)].fire_access() for i in [0...dynamics]

  subscr.stop_tracking()
  subscr.subscribe_all()



performance '/emitter.dependences'
  before: ->
    @subscriber = new Subscriber(->)
    @data = (new Emitter() for _ in [0..50])



performance 'static'
  
  ' 1 length': -> test(@subscriber, @data, 1, 0)
  ' 3 length': -> test(@subscriber, @data, 3, 0)
  ' 5 length': -> test(@subscriber, @data, 5, 0)
  '10 length': -> test(@subscriber, @data, 10, 0)


performance 'random_one'

  ' 1 length': -> test(@subscriber, @data, 0, 1)
  ' 3 length': -> test(@subscriber, @data, 2, 1)
  ' 5 length': -> test(@subscriber, @data, 4, 1)
  '10 length': -> test(@subscriber, @data, 9, 1)


performance 'random_all'

  ' 1 length': -> test(@subscriber, @data, 0, 1)
  ' 3 length': -> test(@subscriber, @data, 0, 3)
  ' 5 length': -> test(@subscriber, @data, 0, 5)
  '10 length': -> test(@subscriber, @data, 0, 10)


performance 'random_10_emitters_dynamic'

  '1 dynamic': -> test(@subscriber, @data, 9, 1)
  '3 dynamic': -> test(@subscriber, @data, 7, 3)
  '5 dynamic': -> test(@subscriber, @data, 5, 5)
  '7 dynamic': -> test(@subscriber, @data, 3, 7)
  '9 dynamic': -> test(@subscriber, @data, 1, 9)
