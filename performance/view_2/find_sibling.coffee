class Behavior
  
  

performance '/view_2.sibling'



performance 'standard'
  before: ->
    @nodes = F.srequire('fierry-pfc/view_2/create/p1x2x6')().nodes_[0].nodes_



performance 'standard.next'

  '0 length': -> @nodes[5].traverse_forward(Behavior)

  '3 length': -> @nodes[2].traverse_forward(Behavior)

  '5 length': -> @nodes[0].traverse_forward(Behavior)



performance 'standard.prev'

  '0 length': -> @nodes[0].traverse_backward(Behavior)

  '3 length': -> @nodes[2].traverse_backward(Behavior)

  '5 length': -> @nodes[5].traverse_backward(Behavior)



performance 'if'
  before: ->
    @nodes = F.srequire('fierry-pfc/view_2/create/i1x2x6')().nodes_[0].nodes_
  


performance 'if.next'

  '0 length': -> @nodes[5].traverse_forward(Behavior)

  '3 length': -> @nodes[2].traverse_forward(Behavior)

  '5 length': -> @nodes[0].traverse_forward(Behavior)



performance 'if.prev'

  '0 length': -> @nodes[0].traverse_backward(Behavior)

  '3 length': -> @nodes[2].traverse_backward(Behavior)

  '5 length': -> @nodes[5].traverse_backward(Behavior)
