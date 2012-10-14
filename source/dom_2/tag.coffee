return class Tag

  create: ($) ->
    $.pnode  = $.parent().node
    $.length = $.value().length

    if !$.next_sibling(Tag)
      $.pnode.className += $.value()

    else
      o = @get_offset_($)
      c = $.pnode.className

      $.pnode.className = c.substr(0, o) + $.value() + ' ' + c.substr(o)
      

  dispose: ($) ->
    o = @get_offset_($)
    c = $.pnode.className

    $.pnode.className = c.substr(0, o) + c.substr(o + $.length + 1)


  get_offset_: ($) ->
    offset = 0

    while $ = $.prev()

      if node.behavior() instanceof Tag
        offset += node.length + 1

    return offset
