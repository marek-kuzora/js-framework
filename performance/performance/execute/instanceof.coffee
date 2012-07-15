class InstanceofClass

performance '/execute.instanceof',
  before: -> @o = new InstanceofClass()

  'class -exact':     -> @o instanceof InstanceofClass

  'class -immediate': -> @o instanceof Object
  
  'class -false':     -> @o instanceof String

  'string':           -> 'a' instanceof InstanceofClass

