#
# @require:
#   BSet: fierry/binary/set
#



#
# Class responsible for executing asynchronous notifications. It
# collects dirty emitters and notifies their listeners in batch in 
# an asynchronous scheduled notification.
#
class Notifier

  constructor: ->
    @queue_ = []
    @frame_ = requestAnimationFrame(@animate_frame_)


  __cleanup__: ->
    cancelAnimationFrame(@frame_)


  animate_frame_: =>
    @frame_ = requestAnimationFrame(@animate_frame_)
    @run()


  #
  # Notifies listeners of registered emitters in batch. Operates in
  # iterations until the queue of emitters is empty. For each
  # iteration copies queue of currently registered emitters and uses
  # an empty visited array to traverse through the emitters and notify
  # its listeners. Once every RUNS_COUNT runs scheduler.try_halt() 
  # to check if the notify does not take too long.
  #
  run: ->
    while @queue_.length
      local = @queue_
      @queue_ = []

      visited = new BSet()
      emitter.notify(visited) for emitter, i in local

    return


  #
  # Registers emitter for scheduled notification.
  #
  # @param e  {Emitter}
  #
  register: (e) ->
    @queue_.push(e)



return new Notifier()
