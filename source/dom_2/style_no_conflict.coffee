return class Style

  create: ($) ->
    $.node = $.parent().node

    if $.traverse_forward(Style, $.type) is null
      $.node.style[$.type] = $.value


  dispose: ($) ->
    if $.traverse_forward(Style, $.type) is null

      if b = $.traverse_backward(Style, $.type)
        $.node.style[b.type] = b.value

      else
        $.node.style[$.type] = null
