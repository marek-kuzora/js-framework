#
# @require:
#   Behavior: fierry/view/behavior
#



class Style extends Behavior

  create: ($, parent) ->
    $.node = parent.node

  update: ($)->
    $.node.style[$.type] = $.value

  dispose: ($) ->
    $.node.style[$.type] = $.parent.get($.type)



return new Style()
