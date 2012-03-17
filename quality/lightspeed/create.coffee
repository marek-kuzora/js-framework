#
# This file loads lightspeed tests for creating primitives, arrays,
# hashes, etc.
#



# Register main group.
lightspeed '/create'



# Load tests.
F.run 'fierry-qa/lightspeed/create/primitives'
F.run 'fierry-qa/lightspeed/create/function'
F.run 'fierry-qa/lightspeed/create/function_prototype'
F.run 'fierry-qa/lightspeed/create/array'
F.run 'fierry-qa/lightspeed/create/hash'
F.run 'fierry-qa/lightspeed/create/class'
