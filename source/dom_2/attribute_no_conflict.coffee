return class Attribute

  create: ($) ->
    $.node = $.parent().node

    if not $.next_sibling(Attribute, $.type)
      $.node.setAttribute($.type, $.value)
      

  dispose: ($) ->

    if l = $.last_sibling(Attribute, $.type)
      $.node.setAttribute(l.type, l.value)

    else
      $.node.removeAttribute($.type)
