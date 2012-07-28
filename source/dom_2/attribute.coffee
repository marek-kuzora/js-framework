return class Attribute

  create: ($) ->
    $.node = $.parent().node
    $.node.setAttribute($.type, $.value)


  dispose: ($) ->
    $.node.removeAttribute($.type)
