#
# @require:
#   world: fierry-qa/performance/model/world-resource
#



#
# This file loads performance tests for handling model.
#



# Register main group.
performance '/model'
  before: ->
    @user = world()



# Load tests.
F.run 'fierry-qa/performance/model/access'
F.run 'fierry-qa/performance/model/set'
