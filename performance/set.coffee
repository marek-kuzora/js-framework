#
# This file loads performance tests for handling sets.
#



# Register main group.
performance '/set'



# Load tests.
F.run 'fierry-pfc/set/create'
F.run 'fierry-pfc/set/contain'
F.run 'fierry-pfc/set/iterate'
F.run 'fierry-pfc/set/maintain'
F.run 'fierry-pfc/set/add_duplicated'
