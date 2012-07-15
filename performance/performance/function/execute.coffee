#
# @require:
#   create:  fierry-qa/performance/function/create-resources.
#   execute: fierry-qa/performance/function/execute-resources.
#



#
# Tests function execution time.
#
performance '/function.execute'



performance 'simple'

  'empty':
    before: -> @fn = (->)
    run:    -> @fn()

  'empty -call':
    before: -> @fn = (->)
    run:    -> @fn.call()

  'empty -call -scope':
    before: -> @scope = {}; @fn = (->)
    run:    -> @fn.call(@scope)

  'empty -closure':
    before: -> arg = null; @fn = (-> arg)
    run:    -> @fn()

  'empty -binding':
    before: -> x = (->); @fn = (-> x.call(x))
    run:    -> @fn()


  'method':
    before: -> @o = new execute.ObjectWithMethod()
    run:    -> @o.method()

  'method -inheritance':
    before: -> @o = new execute.ObjectWithInheritance()
    run:    -> @o.method()

  'method -call':
    before: -> @o = new execute.ObjectWithCall()
    run:    -> @o.method()

  'method -binding':
    before: -> @fn = (new execute.ObjectWithBinding()).method
    run:    -> @fn()
    
  

performance 'data'

  'number':
    before: -> @fn = (-> 12)
    run:    -> @fn()

  'string':
    before: -> @fn = (-> 'string')
    run:    -> @fn()

  'function':
    before: -> @fn = (-> (->))
    run:    -> @fn()


  'object':
    before: -> @fn = (-> new Object())
    run:    -> @fn()
    
  'object +array':
    before: -> @fn = (-> new create.ObjectWithArray)
    run:    -> @fn()
  
  'object +hash':
    before: -> @fn = (-> new create.ObjectWithHash())
    run:    -> @fn()
    
  'object +function':
    before: -> @fn = (-> new create.ObjectWithFunction())
    run:    -> @fn()


  'array':
    before: -> @fn = (-> [])
    run:    -> @fn()

  'array -complex':
    before: -> @fn = (-> ['a', 'b', ['a', 'b', 'c'], 'c'])
    run:    -> @fn()


  'hash':
    before: -> @fn = (-> {})
    run:    -> @fn()

  'hash -complex':
    before: -> @fn = (-> {a: 'a', b: 'b', c: 'c', d: {d: 'd', e: 'e'}})
    run:    -> @fn()
