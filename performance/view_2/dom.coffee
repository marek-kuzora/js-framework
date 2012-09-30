performance '/view_2.dom'

  before: ->
    @prefix = 'fierry-pfc/view_2/dom/'


  ' 3 elements':
    before: -> @v = F.srequire(@prefix + 'd1x3')
    run:    -> @v.run()


  ' 6 elements':
    before: -> @v = F.srequire(@prefix + 'd1x3x2')
    run:    -> @v.run()


  '30 elements':
    before: -> @v = F.srequire(@prefix + 'd1x3x3x2')
    run:    -> @v.run()


  ' 3 elements + 1 text':
    before: -> @v = F.srequire(@prefix + 'tx1x3x1')
    run:    -> @v.run()


  ' 1 element  + 3 text':
    before: -> @v = F.srequire(@prefix + 'tx1x1x3')
    run:    -> @v.run()


  ' 3 elements + 1 attr':
    before: -> @v = F.srequire(@prefix + 'a1x3x1')
    run:    -> @v.run()


  ' 1 element  + 3 attrs':
    before: -> @v = F.srequire(@prefix + 'a1x1x3')
    run:    -> @v.run()


  ' 3 elements + 1 style':
    before: -> @v = F.srequire(@prefix + 's1x3x1')
    run:    -> @v.run()


  ' 1 element  + 3 styles':
    before: -> @v = F.srequire(@prefix + 's1x1x3')
    run:    -> @v.run()


  ' 3 elements + 1 tag':
    before: -> @v = F.srequire(@prefix + 't1x3x1')
    run:    -> @v.run()


  ' 1 element  + 3 tag':
    before: -> @v = F.srequire(@prefix + 't1x1x3')
    run:    -> @v.run()
