return self =

  #
  # Returns object's property that is described by the given
  # array path. Will return undefined if property is not found,
  # or any object in the path doesn't exist.
  #
  # @param o  {Object}          {user: {name: 'Bilbo', age: 123}}.
  # @param p  {Array.<String>}  ['user', 'name'].
  # @return   {*}
  #
  get: (o, p) ->
    for i in p
      return if o is undefined
      o = o[i]
    return o


  #
  # Sets value under specified path. Will create all the objects
  # that are in the path and doesn't already exist.
  #
  # @param o  {Object}          {user: {name: 'Bilbo', age: 123}}.
  # @param p  {Array.<String>}  ['user', 'surname'].
  # @param v  {*}               'Baggins'.
  #
  set: (o, p, v) ->
    i = 0
    l = p.length - 1

    while l--
      e = p[i++]
      o = o[e] ?= {}
    o[p[i]] = v


  clone: (o) ->


  merge: (a, b) ->


  keys: (o) ->
    return Object.keys(o)


  values: (o) ->
    return (v for _, v in o)
