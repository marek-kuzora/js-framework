#
# @require:
#   classes: fierry-qa/performance/class/create-resource.
#



#
# Tests class creation time.
#
performance '/class.create'



#
# Based on prototype length.
#
performance 'prototype'

  ' 0 length': -> new classes.Proto0Length()


  ' 5 length': -> new classes.Proto5Length()


  '10 length': -> new classes.Proto10Length()



#
# Based on prototype inheritance length.
#
performance '/class.create.inheritance'



#
# With default constructor.
#
# Creating via inheritance is rather slow when having more than 1
# super class. Main reason for that is that constructor always calling
# the upper constructor - therefore with five-length inheritance there
# are 5 constructor invocations.
#
performance 'default_constructor'

  ' 1 length': -> new classes.OneInheritance()
  ' 2 length': -> new classes.TwoInheritance()
  ' 3 length': -> new classes.ThreeInheritance()
  ' 4 length': -> new classes.FourInheritance()
  ' 5 length': -> new classes.FiveInheritance()



#
# Without default constructor.
#
# Whenever I inherit without needing to recursivelly call super
# constructor, I'll get same speed as for creating a class without 
# any inheritance.
#
performance 'no_constructor'

  ' 1 length': -> new classes.OneInheritanceNC()
  ' 2 length': -> new classes.TwoInheritanceNC()
  ' 3 length': -> new classes.ThreeInheritanceNC()
  ' 4 length': -> new classes.FourInheritanceNC()
  ' 5 length': -> new classes.FiveInheritanceNC()



#
# Based on properties created in constructor.
#
performance '/class.create.properties'



#
# Based on properties length.
#
performance 'length'

  ' 1 length': -> new classes.Property1Length()

  ' 3 length': -> new classes.Property3Length()

  ' 5 length': -> new classes.Property5Length()

  '10 length': -> new classes.Property10Length()

  '25 length': -> new classes.Property25Length()


#
# Based on properties types.
#
performance 'type'

  'int':      -> new classes.PropertyInt()

  'string':   -> new classes.PropertyString()

  'hash':     -> new classes.PropertyHash()

  'array':    -> new classes.PropertyArray()

  'function': -> new classes.PropertyFunction()
