#
# @require:
#   tracker: fierry/emitter/tracker
#



return nodes =

  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  #                           ABSTRACT
  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -



  Abstract: class Abstract

    parent: ->
      return @parent_


    is_executing: ->
      return @index_ isnt null


    notify_access: (e) ->
      e.subscribe(@)


    next_sibling: (b, t) ->
      i = @index_
      p = @parent_

      loop

        if ++i >= p.nodes_.length

          if p instanceof Parent
            return null

          if p instanceof Special
            i = p.index_
            p = p.parent_

        n = p.nodes_[i]

        if n instanceof Special
          i = 0
          p = n

        else if n.behavior_ instanceof b and (!t or n.type is t)
          return n


    prev_sibling: (b, t) ->
      i = @index_
      p = @parent_

      loop
        if --i <= 0
      
          if p instanceof Parent
            return null

          if p instanceof Special
            i = p.index_
            p = p.parent_

        n = p.nodes_[i]

        if n instanceof Special
          p = n
          i = n.nodes_.length

        else if n.behavior_ instanceof b and (!t or n.type is t)
          return n


    last_sibling: (b, t) ->
      p = @parent_
      i = p.nodes_.length

      loop
        if --i <= 0
      
          if p instanceof Parent
            return null

          if p instanceof Special
            i = p.index_
            p = p.parent_

        n = p.nodes_[i]

        if n instanceof Special
          p = n
          i = p.nodes_.length

        else if n isnt @ and n.behavior_ instanceof b and (!t or n.type is t)
          return n



  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  #                           PARENT
  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -



  Parent: class Parent extends Abstract

    constructor: (@type, @parent_, @behavior_, @nodes_fn_) ->
      @index_ = null
      @nodes_ = null
      @disposed_ = null


    execute: (@index_) ->
      tracker().push(@)
      @behavior_.create(@)

      if @nodes_fn_
        node.execute(i) for node, i in @nodes_ = @nodes_fn_(new Array())

      @behavior_.finalize(@)
      tracker().pop()
      return @


    dispose: ->
      return if @disposed_

      node.dispose() for node in @nodes_

      @behavior_.dispose(@)
      @disposed_ = true


    notify_change: ->
      return if @disposed_

      tracker().push(@)

      if @nodes_fn_
        node.dispose()  for node in @nodes_
        node.execute(i) for node, i in @nodes_ = @nodes_fn_(new Array())

      tracker().pop()



  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  #                           VALUE
  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -



  Value: class Value extends Abstract

    constructor: (@type, @parent_, @behavior_, @value_fn_) ->
      @index_ = null
      @value = null
      @disposed_ = null


    execute: (@index_) ->
      tracker().push(@)
        
      @value = @value_fn_() if @value_fn_
      @behavior_.create(@)

      tracker().pop()
      return @


    dispose: ->
      return if @disposed_

      @behavior_.dispose(@)
      @disposed_ = true


    notify_change: ->
      return if @disposed_

      tracker().push(@)

      @value = @value_fn_() if @value_fn_
      
      @behavior_.dispose(@)
      @behavior_.create(@)

      tracker().pop()



  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  #                           SPECIAL
  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -



  Special: class Special extends Abstract

    parent: ->
      return @parent_.parent()



  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  #                           GROUP
  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -



  Group: class Group extends Special

    constructor: (@parent_, @nodes_fn_) ->
      @index_ = null
      @nodes_ = null
      @disposed_ = null


    execute: (@index_) ->
      tracker().push(@)

      if @nodes_fn_
        for node, i in @nodes_ = @nodes_fn_(new Array())
          node.execute(i)

      tracker().pop()
      return @


   dispose: ->
      return if @disposed_

      node.dispose() for node in @nodes_
      @disposed_ = true


    notify_change: ->
      return if @disposed_

      tracker().push(@)

      if @nodes_fn_
        node.dispose()  for node in @nodes_
        node.execute(i) for node, i in @nodes_ = @nodes_fn_(new Array())

      tracker().pop()



  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  #                           IF
  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -



  If: class If extends Special

    constructor: (@parent_, @value_fn_, @tnodes_fn_, @fnodes_fn_) ->
      @index_ = null
      @value_ = null
      @nodes_ = null
      @disposed_ = null


    execute: (@index_) ->
      tracker().push(@)

      @value_ = @value_fn_()
      @nodes_ = [new Group(@, (if @value_ then @tnodes_fn_ else @fnodes_fn_))]
      @nodes_[0].execute(0)

      tracker().pop()
      return @


    dispose: ->
      return if @disposed_

      @nodes_[0].dispose()
      @disposed_ = true
    

    notify_change: ->
      return if @disposed_

      tracker().push(@)
      value = @value_fn_()

      # If the true/false condition changed
      if (@value_ and !value) or (!@value_ and value)
        @nodes_[0].dispose()

        @value_ = value
        @nodes_ = [new Group(@, (if @value_ then @tnodes_fn_ else @fnodes_fn_))]
        @nodes_[0].execute(0)

      tracker().pop()



  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  #                           FOR
  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -



  For: class For extends Special

    constructor: (@parent_, @value_fn_, @nodes_fn_) ->
      @index_ = null
      @nodes_ = null


    execute: (@index_) ->
