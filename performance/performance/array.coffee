#
# This file loads performance tests for handling arrays.
#



# Register main group.
performance '/array'



# Load tests.
F.run 'fierry-qa/performance/array/create'
F.run 'fierry-qa/performance/array/empty'
F.run 'fierry-qa/performance/array/assign'
F.run 'fierry-qa/performance/array/access'
F.run 'fierry-qa/performance/array/index_of'
