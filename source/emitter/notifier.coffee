#
# @require:
#   BSet: fierry/binary/set
#



#
# Class responsible for executing asynchronous notifications. It
# collects modified emitters and notifies their listeners in batch.
# Enables clients to register callbacks to be executed in consistent
# application state - after all of the notification are performed.
#
class Notifier

  constructor: ->
    @queue_ = []
    @callbacks_ = []
    @animate_frame_()


  #
  # Notifies listeners of the queued emitters in batch. Operates in
  # iterations until the queue of emitters is empty. Tries to block
  # execution of duplicated listeners in each iteration only if the
  # target emitter did not change during the notification. Performs
  # pre_notify() to prepare emitters for notification and
  # post_notify() to cleanup after.
  #
  run: ->

    # While there are pending emitters in the queue.
    while @queue_.length

      # Assign @queue_ into emitters and empty array into @queue_.
      [emitters, @queue_] = [@queue_, new Array()]

      # Prepare emitters for notification.
      e.pre_notify() for e in emitters

      # Notify emitters using BSet to block duplicated listeners.
      set = new BSet()
      e.notify(set) for e in emitters

      # Cleanup emitters after notification.
      e.post_notify() for e in emitters

    # Execute registered callbacks.
    c() while c = @callbacks_.pop()

    # Drop registered callbacks.
    @callbacks_ = []


  #
  # Registers emitter for scheduled notification.
  #
  # @param e  {Emitter}
  #
  register_emitter: (e) ->
    @queue_.push(e)


  #
  # Registers callback for execution after notyfication.
  #
  # @param c  {Function}
  #
  register_callback: (c) ->
    @callbacks_.push(c)


  #
  # Requests next animation frame and starts the notifications.
  #
  animate_frame_: =>
    @frame_ = requestAnimationFrame(@animate_frame_)
    @run()


  #
  # Cleanups the service. Cancels next animation frame using the
  # provided frame identifier.
  #
  __cleanup__: ->
    cancelAnimationFrame(@frame_)



return new Notifier()
