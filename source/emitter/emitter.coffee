#
# @require:
#   tracker:  fierry/emitter/tracker
#   notifier: fierry/emitter/notifier
#
#   BSet:     fierry/binary/set
#



#
# Event emitter for asynchronous events notification and data access
# tracking. When changed, the emitter is registered to Notifier for
# scheduled notification performed in batch. When accessed, the
# emitter is registed to Tracker which builds a dependency between 
# the emitter and current top subscribed listener.
#
return class Emitter

  constructor: ->
    @outdated_   = null
    @listeners_  = new BSet()
    @duplicates_ = null


  #
  # Prepares the emitter for the notification.
  # This method is meant to be extended by Emitter's subclasses.
  #
  pre_notify: ->
    @duplicates_ = false


  #
  # Notifies the registered listeners. Will not execute already
  # invoked listeners unless the emitter has changed during the
  # notification phase.
  #
  # For performance reasons listeners wont receive any information
  # regarding which emitters triggered their notification. If
  # necessary, listeners will need to investigate what has changed 
  # on their own.
  #
  # @param set  {BSet}  set with already executed listeners.
  #
  notify: (set) ->

    # Execute not duplicated listeners or all if the emitter changed.
    @outdated_.each((l) => l.notify() if @duplicates_ or set.add(l))

    # Clear the listeners collection.
    @outdated_ = null


  #
  # Cleanups the emitter after the notification.
  # This method is meant to be extended by Emitter's subclasses.
  #
  post_notify: ->


  #
  # Registers listener to be notified when emitter changes.
  #
  # @param l  {Object}
  #
  register_listener: (l) ->
    @listeners_.add(l)


  #
  # Unregisters listener from the emitter.
  #
  # @param l  {Object}
  #
  unregister_listener: (l) ->
    @listeners_.remove(l)


  #
  # Sets the emitter as changed. Sets all current listeners as
  # outdated and waiting for the notification. If the emitter was
  # clean, this method will also register it to the notifier.
  #
  trigger_change_: ->

    # Enable execution of duplicated listeners.
    @duplicates_ = true

    # Emitter is already outdated, just copy its listeners.
    if @outdated_
      @outdated_.add_all(@listeners_)

    # Emitter is clear, preserve listeners & register for async notify.
    else
      notifier().register_emitter(@)
      @outdated_ = @listeners_

    # Drop existing listeners.
    @listeners_ = new BSet()


  #
  # Sets the emitter as accessed.
  #
  trigger_access_: ->
    tracker().register_emitter(@)
