return class Element

  create: ($) ->
    $.node  = document.createElement($.type)
    $.pnode = $.parent().node


  finalize: ($) ->
    if f = $.traverse_forward(Element)
      $.pnode.insertBefore($.node, f.node)

    else
      $.pnode.appendChild($.node)


  dispose: ($) ->
    $.pnode.removeChild($.node)
