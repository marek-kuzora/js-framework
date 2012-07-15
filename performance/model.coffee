#
# @require:
#   world: fierry-pfc/model/world-resource
#



#
# This file loads performance tests for handling model.
#



# Register main group.
performance '/model'
  before: ->
    @user = world()



# Load tests.
F.run 'fierry-pfc/model/access'
F.run 'fierry-pfc/model/set'
