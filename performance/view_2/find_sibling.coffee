class Behavior



performance '/view_2.sibling'
  before: ->
    @nodes = F.srequire('fierry-pfc/view_2/create/p1x2x6').run().nodes_[0].nodes_



performance 'next'

  '0 length': -> @nodes[5].next_sibling(Behavior)

  '3 length': -> @nodes[2].next_sibling(Behavior)

  '5 length': -> @nodes[0].next_sibling(Behavior)



performance 'prev'

  '0 length': -> @nodes[0].prev_sibling(Behavior)

  '3 length': -> @nodes[2].prev_sibling(Behavior)

  '5 length': -> @nodes[5].prev_sibling(Behavior)



performance 'if'
  before: ->
    @nodes = F.srequire('fierry-pfc/view_2/create/i1x2x6').run().nodes_[0].nodes_
    @start = @nodes[0].group_.nodes_[0]
    @stop  = @nodes[5].group_.nodes_[0]


performance 'if.next'

  '0 length': -> @stop.next_sibling(Behavior)

  '3 length': -> @nodes[2].next_sibling(Behavior)

  '5 length': -> @start.next_sibling(Behavior)



performance 'if.prev'

  '0 length': -> @start.prev_sibling(Behavior)

  '3 length': -> @nodes[2].prev_sibling(Behavior)

  '5 length': -> @stop.prev_sibling(Behavior)

###
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


###
