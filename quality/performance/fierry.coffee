#
# This file loads performance tests for JavaScript execution.
#



# Register main group.
performance '/fierry'



# Load tests.
F.run 'fierry-qa/performance/fierry/uid'
F.run 'fierry-qa/performance/fierry/tag'
F.run 'fierry-qa/performance/fierry/lang'
F.run 'fierry-qa/performance/fierry/accessors'
