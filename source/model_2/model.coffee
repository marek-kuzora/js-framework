#
# @require:
#   Data: fierry/model_2/data
#

return class Model

  constructor: ->
    @submodels_ = {}


  get: (name) ->
    return @submodels_[name]?.get()


  set: (name, value) ->
    data = @submodels_[name] ?= new Data()
    data.set(value)
