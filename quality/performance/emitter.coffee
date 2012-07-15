#
# This file loads performance tests for handling arrays.
#



# Register main group.
performance '/emitter'



# Load tests.
F.run 'fierry-qa/performance/emitter/dependences'
F.run 'fierry-qa/performance/emitter/dependences_new'
F.run 'fierry-qa/performance/emitter/lifecycle'
F.run 'fierry-qa/performance/emitter/lifecycle_new'
F.run 'fierry-qa/performance/emitter/fire_change_new'
