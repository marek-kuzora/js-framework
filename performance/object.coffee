#
# This file loads performance tests for handling objects.
#



# Register main group.
performance '/object'



# Load tests.
F.run 'fierry-pfc/object/create'
F.run 'fierry-pfc/object/assign'
F.run 'fierry-pfc/object/access'
