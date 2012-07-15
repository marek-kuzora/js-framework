#
# @require:
#   res: fierry-qa/performance/function/create-resources.
#



#
# Tests function creation time. It's based on the data defined inside
# the function being created.
#
performance '/function.create'

  'empty':             -> (->)
  'binded':            -> arg = null; (-> arg)

  'number':            -> (-> 12)
  'number -sum':       -> (a, b, c) -> a + b + c

  'string':            -> (-> 'string')
  'string -split':     -> (a) -> a.split('')

  'function':          -> (-> (->))
  'function -sum':     -> (-> (a, b, c) -> a + b + c)

  'object':            -> (-> new Object())
  'object +array':     -> (-> new res.ObjectWithArray())
  'object +hash':      -> (-> new res.ObjectWithHash())
  'object +function':  -> (-> new res.ObjectWithFunction())

  'array':             -> (-> [])
  'array -complex':    -> (-> ['a', ['a', 'b', 'c'], 'b', ['a', 'b', 'c'], 'c'])

  'hash':              -> (-> {})
  'hash -complex':     -> (-> {a: 'a', b: 'b', c: 'c', d: {d: 'd', e: 'e'}})
