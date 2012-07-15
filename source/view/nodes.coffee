return self =

  execute: (action) ->
    action.create()
    self.execute(node) for node in action.nodes
    action.finalize()

  dispose: (action) ->
    action.dispose()
    self.dispose(node) for node in action.nodes
    return
