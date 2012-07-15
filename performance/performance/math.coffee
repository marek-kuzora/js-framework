#
# This file loads performance tests for handling math.
#



# Register main group.
performance '/math'



# Load tests.
F.run 'fierry-qa/performance/math/random'
F.run 'fierry-qa/performance/math/round'
