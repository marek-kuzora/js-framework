#
# This file loads performance tests for JavaScript execution.
#



# Register main group.
performance '/execute'



# Load tests.
F.run 'fierry-qa/performance/execute/for'
F.run 'fierry-qa/performance/execute/delete'
F.run 'fierry-qa/performance/execute/instanceof'
