return class Tag

  create: ($) ->
    $.node = $.parent().node
    $.value = $.value.split(' ')
    
    $.tags = $.parent().tags ?= {}
    
    @insert_tags_($.tags, $.value)
    @set_tags_($)


  dispose: ($) ->
    @erase_tags_($.tags, $.value)
    @set_tags_($)


  insert_tags_: (h, tags) ->
    (h[v] = 1 if not ++h[v]) for v in tags
    return


  erase_tags_: (h, tags) ->
    (delete h[v] if --h[v] == 0) for v in tags
    return


  set_tags_: ($) ->
    $.node.setAttribute('class', Object.keys($.node.tags).join(' '))
