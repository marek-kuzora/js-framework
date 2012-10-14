#
# This file loads performance tests for handling arrays.
#



# Register main group.
performance '/view'



# Load tests.
F.run 'fierry-pfc/view/create'
F.run 'fierry-pfc/view/dom'
F.run 'fierry-pfc/view/siblings'
