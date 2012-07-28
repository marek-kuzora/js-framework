return class Style

  create: ($) ->
    $.node = $.parent().node
    $.node.style[$.type] = $.value


  dispose: ($) ->
    $.node.style[$.type] = null
