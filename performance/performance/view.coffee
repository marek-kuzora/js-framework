#
# This file loads performance tests for handling arrays.
#



# Register main group.
performance '/view'



# Load tests.
F.run 'fierry-qa/performance/view/create'
F.run 'fierry-qa/performance/view/dom'
