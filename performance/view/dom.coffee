performance '/view.dom'
  before: ->
    @prefix = 'fierry-pfc/view/dom/'



performance '_3_div'

  'native': ->
    p = document.createElement('div')
    for j in [0..2]
      n = document.createElement('div')
      p.appendChild(n)


  'auto':
    before: -> @v = F.srequire(@prefix + 'elems_3')
    run:    -> @v.run()



performance '_6_div_article'

  'native': ->
    n0 = document.createElement('div')
    for j in [0..2]
      n1 = document.createElement('div')
      n2 = document.createElement('article')
      n1.appendChild(n2)
      n0.appendChild(n1)


  'auto':
    before: -> @v = F.srequire(@prefix + 'elems_6')
    run:    -> @v.run()



performance '_30x_div_article_section'

  'native': ->
    n0 = document.createElement('div')
    for j in [0..2]
      n1 = document.createElement('div')
      for g in [0..2]
        n2 = document.createElement('article')
        for h in [0..1]
          n3 = document.createElement('section')
          n2.appendChild(n3)
        n1.appendChild(n2)
      n0.appendChild(n1)


  'auto':
    before: -> @v = F.srequire(@prefix + 'elems_30')
    run:    -> @v.run()



performance '_3_div_text'

  'native': ->
    p = document.createElement('div')
    for j in [0..2]
      n = document.createTextNode('text' + j)
      p.appendChild(n)


  'auto':
    before: -> @v = F.srequire(@prefix + '3_div_text')
    run:    -> @v.run()



performance '_3_div_attr'

  'native': ->
    p = document.createElement('div')
    for j in [0..2]
      n = document.createElement('div')
      n.setAttribute('title', 'title')
      p.appendChild(n)


  'auto':
    before: -> @v = F.srequire(@prefix + '3_div_attr')
    run:    -> @v.run()



performance '_1_div_3_attrs'

  'native': ->
    p = document.createElement('div')
    n = document.createElement('div')
    n.setAttribute('title', 'title')
    n.setAttribute('lang', 'pl-PL')
    n.setAttribute('draggable', 'true')
    p.appendChild(n)


  'auto':
    before: -> @v = F.srequire(@prefix + 'div_3_attrs')
    run:    -> @v.run()



performance '_3_div_style'

  'native': ->
    p = document.createElement('div')
    for j in [0..2]
      n = document.createElement('div')
      n.style.color = 'red'
      p.appendChild(n)


  'auto':
    before: -> @v = F.srequire(@prefix + '3_div_style')
    run:    -> @v.run()



performance '_1_div_3_styles'

  'native': ->
    p = document.createElement('div')
    n = document.createElement('div')
    n.style.color = 'red'
    n.style.border = 'solid 1px gold'
    n.style.background = 'gray'
    p.appendChild(n)


  'auto':
    before: -> @v = F.srequire(@prefix + 'div_3_styles')
    run:    -> @v.run()



performance '_3_div_tag'

  'native': ->
    p = document.createElement('div')
    n = document.createElement('div')
    n.className  = 'header '
    n.className += 'content '
    n.className += 'footer'
    p.appendChild(n)


  'auto':
    before: -> @v = F.srequire(@prefix + '3_div_tag')
    run:    -> @v.run()



performance '_1_div_3_tags'

  'native': ->
    p = document.createElement('div')
    for j in [0..2]
      n = document.createElement('div')
      n.className = 'header'
      p.appendChild(n)


  'auto':
    before: -> @v = F.srequire(@prefix + 'div_3_tags')
    run:    -> @v.run()
