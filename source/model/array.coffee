#
# @require:
#   model: fierry/model/utils.model
#



model class Array

  constructor: (@def_, _, @accessor_) ->
    @type_ = @accessor_.get_inner_type()

    @values_    = _ or []
    @accessors_ = []

    @changes_ = new window.Array(@values_.length)


  after_notify: ->
    @changes_ = new window.Array(@values_.length)


  get_changes: ->
    return @changes_


  get: (idx) ->
    return @accessors_[idx] ?= @def_(@type_, @values_[idx])


  set: (idx, value) ->
    return @get(idx).set(value)


  length: ->
    @accessor_.trigger_access_()
    return @values_.length


  indexOf: (value) ->
    @accessor_.trigger_access_()
    return @values_.indexOf(value)


  lastIndexOf: (value) ->
    @accessor_.trigger_access_()
    return @values_.lastIndexOf(value)


  add: (value) ->
    return @add_at(@values_.length, value)


  add_before: (value, before) ->
    return @add_at(@indexOf(before), value)


  add_after: (value, after) ->
    return @add_at(@indexOf(after) + 1, value)


  add_at: (idx, value) ->
    if idx > -1 and idx <= @values_.length
      @values_.splice(idx, 0, value)
      @accessor_.trigger_change_()

      @changes_.splice(idx, 0, 'NEW')
      @accessors_.splice(idx, 0, undefined)
  
      return idx


  remove: (value) ->
    return @remove_at(@indexOf(value))


  remove_at: (idx) ->
    if idx > -1 and idx <= @values_.length
      @accessor_.trigger_change_()

      @accessors_.splice(idx, 1)
      @changes_[idx] = if @changes_[idx] then 'IGNORE' else 'OLD'

      return @values_.splice(idx, 1)[0]


# FOR REMOVE BOtH!
  all: ->
    @accessor_.trigger_access_()
    @accessors_[k] ?= @def_(@type_, v) for v, k in @values_
    return @accessors_


  uid: ->
    return @accessor_.counter_



return (type) ->
  return outer: Array, inner: type
