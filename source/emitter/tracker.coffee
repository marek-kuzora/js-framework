#
# Class responsible for tracking data access from the accessors.
# Clients can subscribe to the tracker to be notified when any model's
# data is accessed. Clients are placed on a stack and only the top
# subscribed listener will be notified when a data access occurs.
#
class Tracker

  constructor: ->
    @stack_ = []


  #
  # Subscribes client to track data access from the accessors. Client
  # should implement track_data_access() method that will receive the
  # accessor as its first and only argument. Please note, that only
  # the top subscribed client will be notified when a data access
  # occurs.
  #
  # @param client  {Object}
  #
  push: (client) ->
    @stack_.push(client)


  #
  # Unsubscribes top subscribed client from tracking the data access
  # from the accessors. Please note, that clients should subscribe 
  # and unsubscribe in a specific stack-based order.
  #
  pop: ->
    @stack_.pop()


  #
  # Notifies the top subscribed client, that a data access occured,
  # and provides the exact dao that accessed its data.
  #
  # @param e  {Emitter}
  #
  track: (e) ->
    return if not @stack_.length
    @stack_[@stack_.length - 1].track_data_access(e)



return new Tracker()
