#
# @require:
#   oop: fierry/util/oop.
#



#
# Object tagging mechanism. Enables client to attach any number of
# labels to any kind of object (hash, function, array, etc) via tag()
# method, and to distinguish objects by their labels using has()
# method.
#
self =

  #
  # Tags the given object with any number of labels. This function
  # accepts variable argument list where all arguments are {String}
  # labels except last {Object} object to tag.
  #
  # @param label   {String}...
  # @param object  {Object}
  #
  # @return        {Object}
  #
  tag: ->
    object = arguments[arguments.length - 1]
    object.__tag__ ?= []

    for i in [0..arguments.length]
      object.__tag__.push(arguments[i])

    return object


  #
  # Returns true if the object contains the given label as its tag.
  #
  # @param label   {String}
  # @param object  {Object}
  #
  is: (label, object) ->
    return if object.__tag__ then object.__tag__.indexOf(label) else false



#
# Wraps tag module with self.tag() function as its root.
#
return oop.install(self.tag, self)
