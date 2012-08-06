return class Attribute

  create: ($) ->
    $.node = $.parent().node

    if $.traverse_forward(Attribute, $.type) is null
      $.node.setAttribute($.type, $.value)
      

  dispose: ($) ->
    if $.traverse_forward(Attribute, $.type) is null

      if b = $.traverse_backward(Attribute, $.type)
        $.node.setAttribute(b.type, b.value)

      else
        $.node.removeAttribute($.type)
