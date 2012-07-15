#
# @require:
#   BSet: fierry/binary/set
#   hash: fest/generator/hash.   
#



return self =

  create: (data = []) ->
    set = new BSet()
    set.add(d) for d in data
    return set


  create_all: (count, sorted) ->
    data = hash.array(count, sorted)
    bset = new BSet()
    bset.add(d) for d in data
    return [bset, data]

  
  maintain: (set, value) ->
    set.remove(value)
    set.add(value)


  iterate: (set, sorted) ->
    it = set.iterator(sorted)
    v while v = it.next()
