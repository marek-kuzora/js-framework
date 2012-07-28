return class Element

  create: ($) ->
    $.node = document.createElement($.type)


  finalize: ($) ->
    p = $.parent()

    if p.finalized and s = $.next_sibling(Element)
      p.node.insertBefore($.node, s)

    else
      p.node.appendChild($.node)


  dispose: ($) ->
    $.parent().node.removeChild($.node)
