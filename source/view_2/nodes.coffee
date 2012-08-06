#
# @require:
#   tracker: fierry/emitter/tracker
#
#   NextSiblingVisitor: fierry/view_2/next_sibling_visitor
#   PrevSiblingVisitor: fierry/view_2/prev_sibling_visitor
#



return nodes =

  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  #                           ABSTRACT
  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -



  Abstract: class Abstract

    parent: ->
      return @parent_

    special_: false


    notify_access: (e) ->
      e.subscribe(@)


    next_sibling_2: (behavior, type) ->
      v = new NextSiblingVisitor(behavior, type)
      return @parent_.run_sibling_visitor(v, @index_)


    prev_sibling_2: (behavior, type) ->
      v = new PrevSiblingVisitor(behavior, type)
      return @parent_.run_sibling_visitor(v, @index_)

    last_sibling_2: (behavior, type) ->
      v = new PrevSiblingVisitor(behavior, type)
      return @parent_.run_sibling_visitor(v, @parent_.nodes_.length)


    next_sibling_3: (b, t) ->
      return @parent_.traverse_forward(@index_, b, t)


    # Cos w tym stylu ??? Ech...
    traverse_forward: (i, b, t) ->
      l = @nodes_.length

      while ++i < l
        n = @nodes_[i]

        if n.index_ is null
          return null

        if n.special_
          return n.traverse_forward(-1, b, t)

        if n.behavior_ instanceof b and (!t or n.type is t)
          return n

      return null


    next_sibling: (b, t) ->
      i = @index_
      p = @parent_

      loop

        if ++i >= p.nodes_.length

          if p.special_
            i = p.index_
            p = p.parent_

          else
            return null

        n = p.nodes_[i]

        if not n.index_
          continue

        if n.special_
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

      @finalized_ = null
      @disposed_ = null


    execute: (@index_) ->
      tracker().push(@)
      @behavior_.create(@)

      if @nodes_fn_
        node.execute(i) for node, i in @nodes_ = @nodes_fn_(new Array())

      @behavior_.finalize(@)
      @finalized_ = true

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


    accept_sibling_visitor: (visitor) ->
      return @ if visitor.is_satisfied(@)


    run_sibling_visitor: (visitor, idx) ->
      return visitor.traverse(@, idx)



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


    accept_sibling_visitor: (visitor) ->
      return @ if visitor.is_satisfied(@)



  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  #                           SPECIAL
  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -



  Special: class Special extends Abstract

    parent: ->
      return @parent_.parent()

    special_: true

    accept_sibling_visitor: (visitor) ->
      return visitor.traverse(@)


    run_sibling_visitor: (visitor, idx) ->
      return visitor.traverse_special(@, idx)




  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  #                           GROUP
  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -



  Group: class Group extends Special

    constructor: (@parent_, @nodes_fn_) ->
      @index_ = null
      @nodes_ = null

      @finalized_ = null
      @disposed_ = null


    execute: (@index_) ->
      tracker().push(@)

      if @nodes_fn_
        for node, i in @nodes_ = @nodes_fn_(new Array())
          node.execute(i)

      @finalized_ = true
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

      @finalized_ = null
      @disposed_ = null


    execute: (@index_) ->
      tracker().push(@)

      @value_ = @value_fn_()
      @nodes_ = [new Group(@, (if @value_ then @tnodes_fn_ else @fnodes_fn_))]
      @nodes_[0].execute(0)

      @finalized_ = true
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
