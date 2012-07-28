#
# @require:
#   tracker: fierry/emitter/tracker
#



return nodes =

  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  #                           ABSTRACT
  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -



  Abstract: class Abstract

    set_index: (@index_) ->


    parent: -> return @parent_


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
      @nodes_ = null
      @finalized = false


    execute: ->
      tracker().push(@)
      @behavior_.create(@)

      if @nodes_fn_

        for node, i in @nodes_ = @nodes_fn_(new Array())
          node.set_index(i)
          node.execute()

      @behavior_.finalize(@)
      tracker().pop()

      @finalized = true
      return @



  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  #                           VALUE
  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -



  Value: class Value extends Abstract

    constructor: (@type, @parent_, @behavior_, @value_fn_) ->
      @value = null


    execute: ->
      tracker().push(@)
        
      @value = @value_fn_() if @value_fn_
      @behavior_.create(@)

      tracker().pop()
      return @



  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  #                           SPECIAL
  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -



  Special: class Special extends Abstract


  If: class If extends Special


  For: class For extends Special


  Group: class Group extends Special
