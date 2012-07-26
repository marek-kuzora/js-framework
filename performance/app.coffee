#
# Starting module for the Fierry Framework Quality Assurance project. 
# This file is responsible for exposing global accessors to test-
# types, loading root files for the test-types tests registration
# and initializating the Fest Framework.
#



# Load global accessors to test-types.
F.run 'fest/performance/type'



# Load main groups for performance testing.
F.run 'fierry-pfc/array'
F.run 'fierry-pfc/class'
F.run 'fierry-pfc/function'
F.run 'fierry-pfc/object'
F.run 'fierry-pfc/set'
F.run 'fierry-pfc/string'

F.run 'fierry-pfc/date'
F.run 'fierry-pfc/execute'
F.run 'fierry-pfc/fierry'
F.run 'fierry-pfc/math'
F.run 'fierry-pfc/primitives'

F.run 'fierry-pfc/draft'

F.run 'fierry-pfc/emitter'
F.run 'fierry-pfc/model'
F.run 'fierry-pfc/view'
F.run 'fierry-pfc/view_2'



# Initialize the Fest Framework.
F.run 'fest/app'
