#
# @require:
#   Action: fierry/view/action
#

FN = (arr) ->
  arr.push(new Action("dummy-2", 'aa', this, null, (-> 1), ((arr) -> arr)))
  return arr

performance '/draft.add_action'

  'create Action':
    before: ->
      @n = (arr) -> return arr
      @v = ->
    run: ->
      new Action("dummy-2", 'aa', this, null, (-> 1), ((arr) -> arr))

  'create Function':
    run: ->
      (arr) ->
        arr.push(new Action("dummy-2", 'aa', this, null, (-> 1), ((arr) -> arr)))
        return arr

  'run Function':
    before: ->
      @fn = (arr) ->
        arr.push(new Action("dummy-2", 'aa', this, null, (-> 1), ((arr) -> arr)))
        return arr
    run: ->
      @fn(new Array())

  'run Function -2':
    run: ->
      FN(new Array())

