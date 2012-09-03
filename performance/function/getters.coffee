performance '/function.getters',

  before: ->
    @o = {x_: 12}
    @o.__defineGetter__('x', -> @['x_'] + 1)
    @o.__defineSetter__('x', (x) -> @['x_'] = x)


  'get -create': -> @o = {}; @o.__defineGetter__('y', -> @['x_'] + 1)

  'set -create': -> @o = {}; @o.__defineSetter__('y', (v) -> @x_ = v - 1)

  'get -access': -> @o.x

  'set -access': -> @o.x = 13

