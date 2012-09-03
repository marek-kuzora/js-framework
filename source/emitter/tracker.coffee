#
# Class responsible for tracking data access from the accessors.
# Clients can subscribe to the tracker to automatically register a
# emitter whenever it is being accessed. Clients are placed on a 
# stack and only the top subscribed listener will be notified when a
# data access occurs.
#
class Tracker

  constructor: ->
    @stack_ = []


  #
  # Registers listener to track emitters accessed. Each listener
  # should implement the notify() method in order to execute when
  # notified by its emitter. Please note, that only the top 
  # subscribed listener will be notified when a data access occurs.
  #
  # @param l  {Object}
  #
  start: (l) ->
    @stack_.push(l)


  #
  # Removes top registered listener from tracking the emitters 
  # accessed. Please note, that listeners should subscribe and
  # unsubscribe in a specific stack-based order.
  #
  stop: ->
    @stack_.pop()


  #
  # Registers the top subscribed listener to the emitter being
  # accessed. Does nothing if there are no registered listeners.
  #
  # @param e  {Emitter}
  #
  register_emitter: (e) ->
    if @stack_.length
      e.register_listener(@stack_[@stack_.length - 1])



return new Tracker()
