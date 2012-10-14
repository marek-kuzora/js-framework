performance '/view.dom'



performance 'auto'
  before: ->
    @prefix = 'fierry-pfc/view/dom/'


  ' 3 elements':
    before: -> @v = F.srequire(@prefix + 'd1x3')
    run:    -> @v.run()


  ' 6 elements':
    before: -> @v = F.srequire(@prefix + 'd1x3x1')
    run:    -> @v.run()


  '30 elements':
    before: -> @v = F.srequire(@prefix + 'd1x3x3x2')
    run:    -> @v.run()


  ' 1 element  + 3 text':
    before: -> @v = F.srequire(@prefix + 'tx1x1x3')
    run:    -> @v.run()


  ' 3 elements + 1 text':
    before: -> @v = F.srequire(@prefix + 'tx1x3x1')
    run:    -> @v.run()


  ' 1 element  + 3 attrs':
    before: -> @v = F.srequire(@prefix + 'a1x1x3')
    run:    -> @v.run()


  ' 3 elements + 1 attr':
    before: -> @v = F.srequire(@prefix + 'a1x3x1')
    run:    -> @v.run()


  ' 1 element  + 3 styles':
    before: -> @v = F.srequire(@prefix + 's1x1x3')
    run:    -> @v.run()


  ' 3 elements + 1 style':
    before: -> @v = F.srequire(@prefix + 's1x3x1')
    run:    -> @v.run()


  ' 1 element  + 3 tag':
    before: -> @v = F.srequire(@prefix + 't1x1x3')
    run:    -> @v.run()


  ' 3 elements + 1 tag':
    before: -> @v = F.srequire(@prefix + 't1x3x1')
    run:    -> @v.run()



performance 'native'

  ' 3 elements': ->
    p = document.createElement('div')
    for j in [0..2]
      n = document.createElement('div')
      p.appendChild(n)


  ' 6 elements': ->
    n0 = document.createElement('div')
    for j in [0..2]
      n1 = document.createElement('div')
      n2 = document.createElement('article')
      n1.appendChild(n2)
      n0.appendChild(n1)


  '30 elements': ->
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


  ' 1 element  + 3 text': ->
    p = document.createElement('div')
    for j in [0..2]
      n = document.createTextNode('text')
      p.appendChild(n)


  ' 3 elements + 1 text': ->
    p = document.createElement('div')
    for j in [0..2]
      n = document.createElement('div')
      t = document.createTextNode('text')
      n.appendChild(t)
      p.appendChild(n)


  ' 1 element  + 3 attrs': ->
    p = document.createElement('div')
    n = document.createElement('div')
    n.setAttribute('title', 'title')
    n.setAttribute('lang', 'pl-PL')
    n.setAttribute('draggable', 'true')
    p.appendChild(n)
    

  ' 3 elements + 1 attr': ->
    p = document.createElement('div')
    for j in [0..2]
      n = document.createElement('div')
      n.setAttribute('id', 'ID')
      p.appendChild(n)


  ' 1 element  + 3 styles': ->
    p = document.createElement('div')
    n = document.createElement('div')
    n.style.color = 'red'
    n.style.border = 'solid 1px gold'
    n.style.background = 'gray'
    p.appendChild(n)


  ' 3 elements + 1 style': ->
    p = document.createElement('div')
    for j in [0..2]
      n = document.createElement('div')
      n.style.color = 'red'
      p.appendChild(n)


  ' 1 element  + 3 tag': ->
    p = document.createElement('div')
    n = document.createElement('div')
    n.className  = 'header '
    n.className += 'content '
    n.className += 'footer'
    p.appendChild(n)


  ' 3 elements + 1 tag': ->
    p = document.createElement('div')
    for j in [0..2]
      n = document.createElement('div')
      n.className = 'header'
      p.appendChild(n)
