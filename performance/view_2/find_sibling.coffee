#
# @require:
#   Behavior: fierry/view_2/behavior
#



performance '/view_2.sibling',

  before: ->
    @view = F.srequire('fierry-pfc/view_2/create/p1x10')()



performance 'next'

  ' 0 length': -> @view.nodes_[9].next_sibling(Behavior)

  ' 5 length': -> @view.nodes_[4].next_sibling(Behavior)

  '10 length': -> @view.nodes_[0].next_sibling(Behavior)



performance 'previous'

  ' 0 length': -> @view.nodes_[0].prev_sibling(Behavior)

  ' 5 length': -> @view.nodes_[4].prev_sibling(Behavior)

  '10 length': -> @view.nodes_[9].prev_sibling(Behavior)
