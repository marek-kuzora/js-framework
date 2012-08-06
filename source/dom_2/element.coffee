return class Element

  create: ($) ->
    $.node = document.createElement($.type)


  finalize: ($) ->
    p = $.parent()

    if f = $.traverse_forward(Element)
      p.node.insertBefore($.node, f.node)

    else
      p.node.appendChild($.node)


  dispose: ($) ->
    $.parent().node.removeChild($.node)
