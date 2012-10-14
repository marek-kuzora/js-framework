#
# @require:
#   Element: fierry/dom/element
#

return class Text extends Element

  create: ($) ->
    $.node  = document.createTextNode($.value())
    $.pnode = $.parent().node

    if f = $.next_sibling(Element)
      $.pnode.insertBefore($.node, f.node)

    else
      $.pnode.appendChild($.node)


  dispose: ($) ->
    $.pnode.removeChild($.node)
