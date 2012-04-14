#
# @require:
#   resources: fierry-qa/lightspeed/create/class.resources
#



#
# Tests class creation time.
#
lightspeed '/create.class'



#
# Based on prototype length.
#
lightspeed 'length'

  ' 0 length': (i) ->
    o = new resources().Proto0Length() while i--
    return


  ' 5 length': (i) ->
    o = new resources().Proto5Length() while i--
    return


  '10 length': (i) ->
    o = new resources().Proto10Length() while i--
    return



#
# Based on prototype inheritance length.
#
# Creating via inheritance is rather slow when having more than 1
# super class. Main reason for that is that constructor always calling
# the upper constructor - therefore with five-length inheritance there
# are 5 constructor invocations.
#
# Whenever I inherit without needing to recursivelly call super
# constructor, I'll get same speed as for creating a class without 
# any inheritance.
#
lightspeed 'inheritance'

  ' 1 length': (i) ->
    o = new resources().OneInheritance() while i--
    return

  ' 2 length': (i) ->
    o = new resources().TwoInheritance() while i--
    return

  ' 3 length': (i) ->
    o = new resources().ThreeInheritance() while i--
    return

  ' 5 length': (i) ->
    o = new resources().FiveInheritance() while i--
    return
