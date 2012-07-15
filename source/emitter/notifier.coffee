#
# Counter indicating how often a scheduler.try_halt() should be run
# with a reasonable performance loss. 1x Date.now(), main component 
# in scheduler.try_halt() operation, is equal to 8x of empty function.
# Running 1x scheduler.try_halt() per 100x of functions, the notifier
# will be up to 10% slower than without running the scheduler.
#
RUNS_COUNT = 100



#
# Class responsible for executing asynchronous notifications. It
# collects dirty emitters and notifies their listeners in batch in 
# an asynchronous scheduled notification.
#
class Notifier

  constructor: ->
    @queue_ = []
    @timer_ = setInterval(@run, 15)


  __cleanup__: ->
    clearInterval(@timer_)


  #
  # Registers emitter for scheduled notification.
  #
  # @param e  {Emitter}
  #
  register: (e) ->
    @queue_.push(e) if not (e in @queue_)


  #
  # Notifies listeners of registered emitters in batch. Operates in
  # iterations until the queue of emitters is empty. For each
  # iteration copies queue of currently registered emitters and uses
  # an empty visited array to traverse through the emitters and notify
  # its listeners. Once every RUNS_COUNT runs scheduler.try_halt() 
  # to check if the notify does not take too long.
  #
  run: =>
    while @queue_.length
      
      local   = @queue_
      @queue_ = []

      visited = []
      emitter.notify(visited) for emitter in local

    return



return new Notifier()
