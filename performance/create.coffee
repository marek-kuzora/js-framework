#
# @require:
#   p: fest/performance/type
#

# Registering main group.
p().group '/create'

# Loading tests.
F.run 'fierry-performance/create/primitives'
