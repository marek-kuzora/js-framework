#
# @require:
#   model: fierry/model/utils.model
#



model class Array

  constructor: (@def_, _, @acc_) ->
    @type_   = @acc_.get_inner_type()

    @accs_   = []
    @values_ = _ || []


  get: (key) ->
    return @accs_[key] ?= @def_(@type_, @values_[key])


  set: (key, value) ->
    @get(key).set(value)


  all: ->
    @acc_.fire_access()
    @accs_[k] ?= @def_(@type_, v) for v, k in @values_
    return @accs_


  length: ->
    @acc_.fire_access()
    return @values_.length


  indexOf: (value) ->
    @acc_.fire_access()
    return @values_.indexOf(value)


  add: (value) ->
    @add_at(@values_.length, value)


  add_before: (value, before) ->
    @add_at(@indexOf(before), value)


  add_after: (value, after) ->
    @add_at(@indexOf(after) + 1, value)
    

  add_at: (i, value) ->
    if i > -1 and i <= @values_.length
      @acc_.fire_change()
      @values_.splice(i, 0, value)
      @accs_.splice(i, 0, undefined)


  remove: (value) ->
    if (i = @indexOf(value)) isnt -1
      @acc_.fire_change()
      @accs_.splice(i, 1) # clear moze??
      return @values_.splice(i, 1)[0]


  uid: ->
    return @acc_.counter_


return (type) ->
  return outer: Array, inner: type
