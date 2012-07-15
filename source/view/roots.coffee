#
# @require:
#   nodes:  fierry/view/nodes.
#   Action: fierry/view/action
#



class Roots

  execute_raw: (type, behavior, n) ->
    nodes.execute(@create_(type, behavior, n))


  create_: (type, behavior, n) ->
    return new Action(type, 0, null, behavior, (->), n)



return new Roots()
