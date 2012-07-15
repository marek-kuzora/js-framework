class ObjectWithMethod
  method: ->

class ObjectWithInheritance extends ObjectWithMethod
    method: -> super

class ObjectWithCall
  method: -> ObjectWithMethod::method.apply(this, arguments)

class ObjectWithBinding
  method: =>


return self =
  ObjectWithCall:        ObjectWithCall
  ObjectWithMethod:      ObjectWithMethod
  ObjectWithBinding:     ObjectWithBinding
  ObjectWithInheritance: ObjectWithInheritance
