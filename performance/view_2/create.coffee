performance '/view_2.create'



performance 'parent'

  before: ->
    @prefix = 'fierry-pfc/view_2/create/p'


  ' 4 actions: 1x3':
    before: -> @view = F.srequire(@prefix + '1x3')
    run:    -> @view()


  ' 4 actions: 1x1x2':
    before: -> @view = F.srequire(@prefix + '1x1x2')
    run:    -> @view()


  ' 4 actions: 1x1x1x1':
    before: -> @view = F.srequire(@prefix + '1x1x1x1')
    run:    -> @view()


  ' 7 actions: 1x6':
    before: -> @view = F.srequire(@prefix + '1x6')
    run:    -> @view()


  ' 7 actions: 1x3x1':
    before: -> @view = F.srequire(@prefix + '1x3x1')
    run:    -> @view()


  ' 7 actions: 1x2x1x1':
    before: -> @view = F.srequire(@prefix + '1x2x1x1')
    run:    -> @view()


  '10 actions: 1x9':
    before: -> @view = F.srequire(@prefix + '1x9')
    run:    -> @view()


  '10 actions: 1x3x2':
    before: -> @view = F.srequire(@prefix + '1x3x2')
    run:    -> @view()


  '10 actions: 1x3x1x1':
    before: -> @view = F.srequire(@prefix + '1x3x1x1')
    run:    -> @view()


  '15 actions: 1x2x6':
    before: -> @view = F.srequire(@prefix + '1x2x6')
    run:    -> @view()


  '15 actions: 1x2x2x2':
    before: -> @view = F.srequire(@prefix + '1x2x2x2')
    run:    -> @view()


  '15 actions: 1x1x1x3x3':
    before: -> @view = F.srequire(@prefix + '1x1x1x3x3')
    run:    -> @view()



performance 'value'

  before: ->
    @prefix = 'fierry-pfc/view_2/create/v'


  ' 4 actions: 1x3':
    before: -> @view = F.srequire(@prefix + '1x3')
    run:    -> @view()


  ' 4 actions: 1x1x2':
    before: -> @view = F.srequire(@prefix + '1x1x2')
    run:    -> @view()


  ' 4 actions: 1x1x1x1':
    before: -> @view = F.srequire(@prefix + '1x1x1x1')
    run:    -> @view()


  ' 7 actions: 1x6':
    before: -> @view = F.srequire(@prefix + '1x6')
    run:    -> @view()


  ' 7 actions: 1x3x1':
    before: -> @view = F.srequire(@prefix + '1x3x1')
    run:    -> @view()


  ' 7 actions: 1x2x1x1':
    before: -> @view = F.srequire(@prefix + '1x2x1x1')
    run:    -> @view()


  '10 actions: 1x9':
    before: -> @view = F.srequire(@prefix + '1x9')
    run:    -> @view()


  '10 actions: 1x3x2':
    before: -> @view = F.srequire(@prefix + '1x3x2')
    run:    -> @view()


  '10 actions: 1x3x1x1':
    before: -> @view = F.srequire(@prefix + '1x3x1x1')
    run:    -> @view()


  '15 actions: 1x2x6':
    before: -> @view = F.srequire(@prefix + '1x2x6')
    run:    -> @view()


  '15 actions: 1x2x2x2':
    before: -> @view = F.srequire(@prefix + '1x2x2x2')
    run:    -> @view()


  '15 actions: 1x1x1x3x3':
    before: -> @view = F.srequire(@prefix + '1x1x1x3x3')
    run:    -> @view()



performance 'if'

  before: ->
    @prefix = 'fierry-pfc/view_2/create/i'


  ' 4 actions: 1x3':
    before: -> @view = F.srequire(@prefix + '1x3')
    run:    -> @view()


  ' 4 actions: 1x1x2':
    before: -> @view = F.srequire(@prefix + '1x1x2')
    run:    -> @view()


  ' 4 actions: 1x1x1x1':
    before: -> @view = F.srequire(@prefix + '1x1x1x1')
    run:    -> @view()


  ' 7 actions: 1x6':
    before: -> @view = F.srequire(@prefix + '1x6')
    run:    -> @view()


  ' 7 actions: 1x3x1':
    before: -> @view = F.srequire(@prefix + '1x3x1')
    run:    -> @view()


  ' 7 actions: 1x2x1x1':
    before: -> @view = F.srequire(@prefix + '1x2x1x1')
    run:    -> @view()


  '10 actions: 1x9':
    before: -> @view = F.srequire(@prefix + '1x9')
    run:    -> @view()


  '10 actions: 1x3x2':
    before: -> @view = F.srequire(@prefix + '1x3x2')
    run:    -> @view()


  '10 actions: 1x3x1x1':
    before: -> @view = F.srequire(@prefix + '1x3x1x1')
    run:    -> @view()


  '15 actions: 1x2x6':
    before: -> @view = F.srequire(@prefix + '1x2x6')
    run:    -> @view()


  '15 actions: 1x2x2x2':
    before: -> @view = F.srequire(@prefix + '1x2x2x2')
    run:    -> @view()


  '15 actions: 1x1x1x3x3':
    before: -> @view = F.srequire(@prefix + '1x1x1x3x3')
    run:    -> @view()
