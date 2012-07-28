return class Style

  create: ($) ->
    $.node = $.parent().node

    if not $.next_sibling(Style, $.type)
      $.node.style[$.type] = $.value


  dispose: ($) ->
    if l = $.last_sibling(Style, $.type)
      $.node.style[l.type] = l.value

    else
      $.node.style[$.type] = null
