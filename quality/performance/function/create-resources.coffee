class ObjectWithArray
  constructor: -> @array = []

class ObjectWithHash
  constructor: -> @hash = {}

class ObjectWithFunction
  constructor: -> @function = (->)



return self =

  ObjectWithHash:     ObjectWithHash
  ObjectWithArray:    ObjectWithArray
  ObjectWithFunction: ObjectWithFunction
