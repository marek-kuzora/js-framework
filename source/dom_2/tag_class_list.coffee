#
# Tag based on classList property. Is as fast as standard tag handling.
# Currently not implemented in IE10 or below.
#
return class Tag

  create: ($) ->
    $.classes = $.parent().node.classList
    
    if $.old_value
      $.classes.remove($.old_value)

    if $.value()
      $.classes.add($.value())

    $.old_value = $.value()


  dispose: ($) ->
    if $.old_value
      $.classes.remove($.old_value)
