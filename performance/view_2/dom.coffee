performance '/view_2.dom'

  before: ->
    @prefix = 'fierry-pfc/view_2/dom/'


  ' 3 elements':
    before: -> @v = F.srequire(@prefix + 'd1x3')
    run:    -> @v()


  ' 6 elements':
    before: -> @v = F.srequire(@prefix + 'd1x3x2')
    run:    -> @v()


  '30 elements':
    before: -> @v = F.srequire(@prefix + 'd1x3x3x2')
    run:    -> @v()


  '3 elements + 1 attr':
    before: -> @v = F.srequire(@prefix + 'a1x3x1')
    run:    -> @v()


  '1 element  + 3 attrs':
    before: -> @v = F.srequire(@prefix + 'a1x1x3')
    run:    -> @v()


  '3 elements + 1 style':
    before: -> @v = F.srequire(@prefix + 's1x3x1')
    run:    -> @v()


  '1 element  + 3 styles':
    before: -> @v = F.srequire(@prefix + 's1x1x3')
    run:    -> @v()
