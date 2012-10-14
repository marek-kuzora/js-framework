return class Style

  create: ($) ->
    $.node = $.parent().node

    if $.next_sibling(Style, $.type()) is null
      $.node.style[$.type()] = $.value()


  dispose: ($) ->
    if $.next_sibling(Style, $.type()) is null

      if b = $.prev_sibling(Style, $.type())
        $.node.style[$.type()] = b.value

      else
        $.node.style[$.type()] = null
