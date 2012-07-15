#
# @require:
#   tracker:  fierry/emitter/tracker
#   notifier: fierry/emitter/notifier
#
#   BSet:     fierry/binary/set
#



return class Emitter

  constructor: ->
    @outdated_  = null
    @listeners_ = new BSet()


  subscribe: (l) ->
    @listeners_.add(l)


  unsubscribe: (l) ->
    @listeners_.remove(l)


  notify: (visited) ->

    # Execute not duplicated listeners.
    i = @outdated_.iterator()
    l.notify_change() while l = i.next() when visited.add(l)

    # Clear the listeners collection.
    @outdated_ = null


  fire_change: ->

    # Emitter is already outdated, just copy its listeners.
    if @outdated_
      @outdated_.add_all(@listeners_)

    # Preserve the current listeners and register for async notify.
    else
      @outdated_ = @listeners_
      notifier().register(@)

    # Clear current listeners
    @listeners_ = new BSet()


  fire_access: ->
    tracker().track(@)
