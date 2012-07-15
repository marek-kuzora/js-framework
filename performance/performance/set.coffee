#
# This file loads performance tests for handling sets.
#



# Register main group.
performance '/set'



# Load tests.
F.run 'fierry-qa/performance/set/create'
F.run 'fierry-qa/performance/set/contain'
F.run 'fierry-qa/performance/set/iterate'
F.run 'fierry-qa/performance/set/maintain'
F.run 'fierry-qa/performance/set/add_duplicated'
