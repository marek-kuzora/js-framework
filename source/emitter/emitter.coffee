#
# @require:
#   tracker:  fierry/emitter/tracker
#   notifier: fierry/emitter/notifier
#   array:    fierry/util/array.
#



#
# Event emitter for asynchronous events notifications. Whenever 
# a change occurrs and dispatch() method is invoked and the emitter 
# is registered for scheduled notification in batch. For performance
# reasons, this emitter will not provide data what has changed, or why
# the listener is invoked - it will only notify that a change has
# occurred - listener itself needs to investigate what has changed
# whenever necessary.
#
# Each listener is guaranteed to be invoked once only, even if
# multiple changes has occurred and the listener was 'dispatched' 
# from many asynchronous emitters during that time. This behavior 
# is not guaranteed for changes that happened after scheduled
# notification has started.
#
return class Emitter

  #
  # Subscribes listener to the emitter. For performance reasons, 
  # the emitter does not prevent from subscribing same listener
  # multiple times. Client is reponsible for assuring that each
  # listener will be subscribed only once.
  #
  # @param fn  {->}  listener.
  #
  subscribe: (listener) ->
    @get_listeners_().push(listener)


  #
  # Unsubscribes listener from the emitter. This method will
  # unsubscribe all instances of the same listener if found.
  # However it is unnecessary for clients to register same
  # listeners multiple times.
  #
  # @param fn  {->}  listener.
  #
  unsubscribe: (listener) ->
    array.remove_all(@get_listeners_(), listener)


  #
  # Notifies the subscribed listeners that a change occured. For
  # performance reasons, this emitter will not provide data what has
  # changed, or why the listener is invoked.
  #
  # @param visited  {Array.<Boolean>}  array of already invoked
  #                                    listeners by their uids.
  #
  notify: (visited) ->
    #console.log 'NOTIFIED', @, @get?(), @get_listeners_().length
    (l(); visited[F.uid(l)] = false) for l in @get_listeners_() when l
    return


  #
  # Retrieves subscribed listeners.
  #
  # @return  listeners  {Array.<(->)>}
  #
  get_listeners_: ->
    return @listeners_registry_ ?= []


  #
  # Registers the emitter for scheduled notification in batch.
  # Will do nothing if the emitter is disabled.
  #
  fire_change: ->
    notifier().register(@) if not @emitter_disabled_


  #
  # Registers emitter data access into the tracker.
  # Will do nothing if the emitter is disabled.
  #
  fire_access: ->
    tracker().track(@) if not @emitter_disabled_


  #
  # Sets emitter as disabled or enabled. Disabled emitters will not
  # dispatch changes to their listeners.
  #
  # @param Boolean enabled
  #
  set_emitter_disabled: (disable) ->
    @emitter_disabled_ = disable
