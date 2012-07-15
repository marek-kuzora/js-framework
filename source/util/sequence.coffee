return class Sequence

  constructor: ->
    @counter_ = 0


  next: ->
    return @counter_++
