#
# Starting module for the Fierry Framework Quality Assurance project. 
# This file is responsible for exposing global accessors to test-
# types, loading root files for the test-types tests registration
# and initializating the Fest Framework.
#



# Load global accessors to test-types.
F.run 'fest/lightspeed/type'
F.run 'fest/performance/type'



# Load root files for test-types tests registration.
F.run 'fierry-qa/lightspeed'
F.run 'fierry-qa/performance'



# Initialize the Fest Framework.
F.run 'fest/app'
