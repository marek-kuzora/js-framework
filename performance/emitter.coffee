#
# This file loads performance tests for handling arrays.
#



# Register main group.
performance '/emitter'



# Load tests.
F.run 'fierry-pfc/emitter/dependences'
F.run 'fierry-pfc/emitter/dependences_new'
F.run 'fierry-pfc/emitter/lifecycle'
F.run 'fierry-pfc/emitter/lifecycle_new'
F.run 'fierry-pfc/emitter/fire_change_new'
