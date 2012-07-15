#
# @require:
#   tracker: fierry/emitter/tracker
#



return class Subscriber

  constructor: (@listener_) ->
    @prev_ = []
    @curr_ = []


  subscribe_all: ->
    for e in @prev_ when @curr_.indexOf(e) is -1
      e.unsubscribe(@listener_)

    for e in @curr_ when @prev_.indexOf(e) is -1
      e.subscribe(@listener_)

    @prev_ = @curr_
    @curr_ = []


  unsubscribe_all: ->
    e.unsubscribe(@listener_) for e in @prev_
    return


  start_tracking: ->
    tracker().push(@)


  stop_tracking: ->
    tracker().pop()


  track_data_access: (e) ->
    @curr_.push(e)
