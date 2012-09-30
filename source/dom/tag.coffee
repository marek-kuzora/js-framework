#
# @require:
#   Behavior: fierry/view/behavior
#



class Tag extends Behavior

  create: ($, parent) ->
    $.classes = parent.node.classList


  update: ($)->
    if $.old_value
      $.classes.remove($.old_value)

    if $.value
      $.classes.add($.value)

    $.old_value = $.value


  dispose: ($) ->
    if $.old_value
      $.classes.remove($.old_value)



return new Tag()

