#
# This file loads performance tests for handling arrays.
#



# Register main group.
performance '/array'



# Load tests.
F.run 'fierry-pfc/array/create'
F.run 'fierry-pfc/array/empty'
F.run 'fierry-pfc/array/assign'
F.run 'fierry-pfc/array/access'
F.run 'fierry-pfc/array/index_of'
