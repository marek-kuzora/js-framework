#
# @require:
#   Emitter: fierry/emitter/emitter
#   tracker: fierry/emitter/tracker
#



performance '/emitter.dependences'
  before: ->
    @listener = new Listener()
    @data = (new Emitter() for _ in [0..50])



performance 'static'
  
  ' 1 length': -> test(@listener, @data, 1, 0)
  ' 3 length': -> test(@listener, @data, 3, 0)
  ' 5 length': -> test(@listener, @data, 5, 0)
  '10 length': -> test(@listener, @data, 10, 0)


performance 'random_one'

  ' 1 length': -> test(@listener, @data, 0, 1)
  ' 3 length': -> test(@listener, @data, 2, 1)
  ' 5 length': -> test(@listener, @data, 4, 1)
  '10 length': -> test(@listener, @data, 9, 1)


performance 'random_all'

  ' 1 length': -> test(@listener, @data, 0, 1)
  ' 3 length': -> test(@listener, @data, 0, 3)
  ' 5 length': -> test(@listener, @data, 0, 5)
  '10 length': -> test(@listener, @data, 0, 10)


performance 'random_10_emitters_dynamic'

  '1 dynamic': -> test(@listener, @data, 9, 1)
  '3 dynamic': -> test(@listener, @data, 7, 3)
  '5 dynamic': -> test(@listener, @data, 5, 5)
  '7 dynamic': -> test(@listener, @data, 3, 7)
  '9 dynamic': -> test(@listener, @data, 1, 9)



class Listener

  notify: ->



test = (listener, array, statics, dynamics) ->
  tracker().start(listener)

  array[i].trigger_access_() for i in [0...statics]
  array[F.random(50)].trigger_access_() for i in [0...dynamics]

  tracker().stop()
