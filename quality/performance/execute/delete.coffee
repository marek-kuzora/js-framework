#
# @require:
#   gen: fest/generator/base.
#


performance '/execute.delete'

performance 'hash'

  ' 0 length':
    before_each: -> @h = {}
    run:         -> delete @h['aa']


  ' 1 length':
    before_each: -> @h = {aa: 'aa'}
    run:         -> delete @h['aa']


  ' 5 length':
    before_each: -> @h = gen.hash_5()
    run:         -> delete @h['aa']


  '10 length':
    before_each: -> @h = gen.hash_10()
    run:         -> delete @h['aa']


  '20 length':
    before_each: -> @h = gen.hash_20()
    run:         -> delete @h['aa']


  '50 length':
    before_each: -> @h = gen.hash_50()
    run:         -> delete @h['aa']
