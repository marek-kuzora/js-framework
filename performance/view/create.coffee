performance '/view.create'
  before: ->
    @prefix = 'fierry-pfc/view/'


  ' 4 actions: 1x3':
    before: -> @v = F.srequire(@prefix + 'create/1x3')
    run:    -> @v.run()


  ' 4 actions: 1x3 -template':
    before: -> @v = F.srequire(@prefix + 'create/1x3-tpl')
    run:    -> @v.run()


  ' 4 actions: 1x1x1x1':
    before: -> @v = F.srequire(@prefix + 'create/1x1x1x1')
    run:    -> @v.run()


  ' 6 actions: 1x5':
    before: -> @v = F.srequire(@prefix + 'create/1x5')
    run:    -> @v.run()


  ' 7 actions: 1x3x1':
    before: -> @v = F.srequire(@prefix + 'create/1x3x1')
    run:    -> @v.run()


  ' 7 actions: 1x2x1x1':
    before: -> @v = F.srequire(@prefix + 'create/1x2x1x1')
    run:    -> @v.run()


  '10 actions: 1x3x2':
    before: -> @v = F.srequire(@prefix + 'create/1x3x2')
    run:    -> @v.run()


  '10 actions: 1x3x2 -template':
    before: -> @v = F.srequire(@prefix + 'create/1x3x2-tpl')
    run:    -> @v.run()
