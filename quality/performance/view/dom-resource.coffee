#
# @require:
#   Behavior: fierry/view/behavior
#



#
# Root for performance testing of DOM action hierarchies.
#
class Dom extends Behavior

  create: ($) ->
    $.node = document.createElement('div')



return new Dom()

