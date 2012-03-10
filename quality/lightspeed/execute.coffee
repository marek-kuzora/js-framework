#
# This file loads lightspeed tests for executing different kinds of
# functions, wrapping simple expressions into functions, etc.
#



# Register main group.
lightspeed '/execute'



# Load tests.
F.run 'fierry-qa/lightspeed/execute/function'
F.run 'fierry-qa/lightspeed/execute/accessors'
