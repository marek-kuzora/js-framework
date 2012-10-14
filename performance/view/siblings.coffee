class Behavior



performance '/view.sibling'
  before: ->
    @nodes = F.srequire('fierry-pfc/view/create/p1x2x6').run().nodes_[0].nodes_



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
    @nodes = F.srequire('fierry-pfc/view/create/i1x2x6').run().nodes_[0].nodes_
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
