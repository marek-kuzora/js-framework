#
# This file loads performance tests for handling objects.
#



# Register main group.
performance '/object'



# Load tests.
F.run 'fierry-qa/performance/object/create'
F.run 'fierry-qa/performance/object/assign'
F.run 'fierry-qa/performance/object/access'
