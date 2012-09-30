return class Attribute

  create: ($) ->
    $.node = $.parent().node

    if $.next_sibling(Attribute, $.type()) is null
      $.node.setAttribute($.type(), $.value())
      

  dispose: ($) ->
    if $.next_sibling(Attribute, $.type()) is null

      if b = $.prev_sibling(Attribute, $.type())
        $.node.setAttribute(b.type(), b.value())

      else
        $.node.removeAttribute($.type())
