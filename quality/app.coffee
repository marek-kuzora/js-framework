#
# Starting module for the Fierry Framework Quality Assurance project. 
# This file is responsible for exposing global accessors to test-
# types, loading root files for the test-types tests registration
# and initializating the Fest Framework.
#



# Load global accessors to test-types.
F.run 'fest/performance/type'



# Load main groups for performance testing.
F.run 'fierry-qa/performance/array'
F.run 'fierry-qa/performance/class'
F.run 'fierry-qa/performance/function'
F.run 'fierry-qa/performance/object'
F.run 'fierry-qa/performance/set'
F.run 'fierry-qa/performance/string'

F.run 'fierry-qa/performance/date'
F.run 'fierry-qa/performance/execute'
F.run 'fierry-qa/performance/fierry'
F.run 'fierry-qa/performance/math'
F.run 'fierry-qa/performance/primitives'

F.run 'fierry-qa/performance/draft'

F.run 'fierry-qa/performance/emitter'
F.run 'fierry-qa/performance/model'
F.run 'fierry-qa/performance/view'



# Initialize the Fest Framework.
F.run 'fest/app'
