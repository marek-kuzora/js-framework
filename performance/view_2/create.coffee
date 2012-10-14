performance '/view_2.create'



performance 'parent'

  before: ->
    @prefix = 'fierry-pfc/view_2/create/p'


  ' 4 actions: 1x3':
    before: -> @view = F.srequire(@prefix + '1x3')
    run:    -> @view.run()


  ' 4 actions: 1x1x2':
    before: -> @view = F.srequire(@prefix + '1x1x2')
    run:    -> @view.run()


  ' 4 actions: 1x1x1x1':
    before: -> @view = F.srequire(@prefix + '1x1x1x1')
    run:    -> @view.run()


  ' 7 actions: 1x6':
    before: -> @view = F.srequire(@prefix + '1x6')
    run:    -> @view.run()


  ' 7 actions: 1x3x1':
    before: -> @view = F.srequire(@prefix + '1x3x1')
    run:    -> @view.run()


  ' 7 actions: 1x2x1x1':
    before: -> @view = F.srequire(@prefix + '1x2x1x1')
    run:    -> @view.run()


  '10 actions: 1x9':
    before: -> @view = F.srequire(@prefix + '1x9')
    run:    -> @view.run()


  '10 actions: 1x3x2':
    before: -> @view = F.srequire(@prefix + '1x3x2')
    run:    -> @view.run()


  '10 actions: 1x3x1x1':
    before: -> @view = F.srequire(@prefix + '1x3x1x1')
    run:    -> @view.run()


  '15 actions: 1x2x6':
    before: -> @view = F.srequire(@prefix + '1x2x6')
    run:    -> @view.run()


  '15 actions: 1x2x2x2':
    before: -> @view = F.srequire(@prefix + '1x2x2x2')
    run:    -> @view.run()


  '15 actions: 1x1x1x3x3':
    before: -> @view = F.srequire(@prefix + '1x1x1x3x3')
    run:    -> @view.run()



performance 'value'

  before: ->
    @prefix = 'fierry-pfc/view_2/create/v'


  ' 4 actions: 1x3':
    before: -> @view = F.srequire(@prefix + '1x3')
    run:    -> @view.run()


  ' 4 actions: 1x1x2':
    before: -> @view = F.srequire(@prefix + '1x1x2')
    run:    -> @view.run()


  ' 4 actions: 1x1x1x1':
    before: -> @view = F.srequire(@prefix + '1x1x1x1')
    run:    -> @view.run()


  ' 7 actions: 1x6':
    before: -> @view = F.srequire(@prefix + '1x6')
    run:    -> @view.run()


  ' 7 actions: 1x3x1':
    before: -> @view = F.srequire(@prefix + '1x3x1')
    run:    -> @view.run()


  ' 7 actions: 1x2x1x1':
    before: -> @view = F.srequire(@prefix + '1x2x1x1')
    run:    -> @view.run()


  '10 actions: 1x9':
    before: -> @view = F.srequire(@prefix + '1x9')
    run:    -> @view.run()


  '10 actions: 1x3x2':
    before: -> @view = F.srequire(@prefix + '1x3x2')
    run:    -> @view.run()


  '10 actions: 1x3x1x1':
    before: -> @view = F.srequire(@prefix + '1x3x1x1')
    run:    -> @view.run()


  '15 actions: 1x2x6':
    before: -> @view = F.srequire(@prefix + '1x2x6')
    run:    -> @view.run()


  '15 actions: 1x2x2x2':
    before: -> @view = F.srequire(@prefix + '1x2x2x2')
    run:    -> @view.run()


  '15 actions: 1x1x1x3x3':
    before: -> @view = F.srequire(@prefix + '1x1x1x3x3')
    run:    -> @view.run()



performance 'if'

  before: ->
    @prefix = 'fierry-pfc/view_2/create/i'


  ' 4 actions: 1x3':
    before: -> @view = F.srequire(@prefix + '1x3')
    run:    -> @view.run()


  ' 4 actions: 1x1x2':
    before: -> @view = F.srequire(@prefix + '1x1x2')
    run:    -> @view.run()


  ' 4 actions: 1x1x1x1':
    before: -> @view = F.srequire(@prefix + '1x1x1x1')
    run:    -> @view.run()


  ' 7 actions: 1x6':
    before: -> @view = F.srequire(@prefix + '1x6')
    run:    -> @view.run()


  ' 7 actions: 1x3x1':
    before: -> @view = F.srequire(@prefix + '1x3x1')
    run:    -> @view.run()


  ' 7 actions: 1x2x1x1':
    before: -> @view = F.srequire(@prefix + '1x2x1x1')
    run:    -> @view.run()


  '10 actions: 1x9':
    before: -> @view = F.srequire(@prefix + '1x9')
    run:    -> @view.run()


  '10 actions: 1x3x2':
    before: -> @view = F.srequire(@prefix + '1x3x2')
    run:    -> @view.run()


  '10 actions: 1x3x1x1':
    before: -> @view = F.srequire(@prefix + '1x3x1x1')
    run:    -> @view.run()


  '15 actions: 1x2x6':
    before: -> @view = F.srequire(@prefix + '1x2x6')
    run:    -> @view.run()


  '15 actions: 1x2x2x2':
    before: -> @view = F.srequire(@prefix + '1x2x2x2')
    run:    -> @view.run()


  '15 actions: 1x1x1x3x3':
    before: -> @view = F.srequire(@prefix + '1x1x1x3x3')
    run:    -> @view.run()



performance 'for'

  before: ->
    @prefix = 'fierry-pfc/view_2/create/f'


  ' 4 actions: 1x3':
    before: -> @view = F.srequire(@prefix + '1x3')
    run:    -> @view.run([1, 2, 3])


  ' 4 actions: 1x1x2':
    before: -> @view = F.srequire(@prefix + '1x1x2')
    run:    -> @view.run([1, 2])


  ' 4 actions: 1x1x1x1':
    before: -> @view = F.srequire(@prefix + '1x1x1x1')
    run:    -> @view.run([1])


  ' 7 actions: 1x6':
    before: -> @view = F.srequire(@prefix + '1x6')
    run:    -> @view.run([1, 2, 3, 4, 5, 6])


  ' 7 actions: 1x3x1':
    before: -> @view = F.srequire(@prefix + '1x3x1')
    run:    -> @view.run([1, 2, 3])


  ' 7 actions: 1x2x1x1':
    before: -> @view = F.srequire(@prefix + '1x2x1x1')
    run:    -> @view.run([1, 2])


  '10 actions: 1x9':
    before: -> @view = F.srequire(@prefix + '1x9')
    run:    -> @view.run([1, 2, 3, 4, 5, 6, 7, 8, 9])


  '10 actions: 1x3x2':
    before: -> @view = F.srequire(@prefix + '1x3x2')
    run:    -> @view.run([1, 2, 3])


  '10 actions: 1x3x1x1':
    before: -> @view = F.srequire(@prefix + '1x3x1x1')
    run:    -> @view.run([1, 2, 3])


  '15 actions: 1x2x6':
    before: -> @view = F.srequire(@prefix + '1x2x6')
    run:    -> @view.run([1, 2, 3, 4, 5, 6])


  '15 actions: 1x2x2x2':
    before: -> @view = F.srequire(@prefix + '1x2x2x2')
    run:    -> @view.run([1, 2])


  '15 actions: 1x1x1x3x3':
    before: -> @view = F.srequire(@prefix + '1x1x1x3x3')
    run:    -> @view.run([1, 2, 3])


performance 'use'

  before: ->
    @prefix = 'fierry-pfc/view_2/create/u'


  ' 4 actions: 1x3':
    before: -> @view = F.srequire(@prefix + '1x3')
    run:    -> @view.run()


  ' 4 actions: 1x1x2':
    before: -> @view = F.srequire(@prefix + '1x1x2')
    run:    -> @view.run()


  ' 4 actions: 1x1x1x1':
    before: -> @view = F.srequire(@prefix + '1x1x1x1')
    run:    -> @view.run()


  ' 7 actions: 1x6':
    before: -> @view = F.srequire(@prefix + '1x6')
    run:    -> @view.run()


  ' 7 actions: 1x3x1':
    before: -> @view = F.srequire(@prefix + '1x3x1')
    run:    -> @view.run()


  ' 7 actions: 1x2x1x1':
    before: -> @view = F.srequire(@prefix + '1x2x1x1')
    run:    -> @view.run()


  '10 actions: 1x9':
    before: -> @view = F.srequire(@prefix + '1x9')
    run:    -> @view.run()


  '10 actions: 1x3x2':
    before: -> @view = F.srequire(@prefix + '1x3x2')
    run:    -> @view.run()


  '10 actions: 1x3x1x1':
    before: -> @view = F.srequire(@prefix + '1x3x1x1')
    run:    -> @view.run()


  '15 actions: 1x2x6':
    before: -> @view = F.srequire(@prefix + '1x2x6')
    run:    -> @view.run()


  '15 actions: 1x2x2x2':
    before: -> @view = F.srequire(@prefix + '1x2x2x2')
    run:    -> @view.run()


  '15 actions: 1x1x1x3x3':
    before: -> @view = F.srequire(@prefix + '1x1x1x3x3')
    run:    -> @view.run()
