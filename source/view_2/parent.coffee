#
# @require:
#   tracker: fierry/emitter/tracker
#



return class Parent

  constructor: (@type, @parent_, @behavior_, @nodes_fn_) ->
    @nodes_ = null


  execute: ->
    tracker().push(@)
    @behavior_.create(@)

    if @nodes_fn_

      for node, i in @nodes_ = @nodes_fn_(new Array())
        node.set_index(i)
        node.execute()

    @behavior_.finalize(@)
    tracker().pop()
    return @


  set_index: (@index_) ->


  next_sibling: (b, t) ->
    i = @index_
    p = @parent_

    loop

      if ++i >= p.nodes_.length

        if p instanceof Parent
          return null

        #if p instanceof If or p instanceof For
        #  i = p.index_
        #  p = p.parent_

      n = p.nodes_[i]

      #if n instanceof If or n instanceof For
      #  p = n
      #  i = 0
      #  continue # --- REMOVE?

      if n.behavior_ instanceof b and (!t or n.type is t)
        return n

###
   Zaczynamy od ojca konkretnego node'a! To nigdy nie bedzie value. Ide do przodu.

   Jesli natrafie na IF/FOR to normalnie schodze w dol zmieniajac i & p. Nastepnie gdy dochodze do konca elementu i okazuje sie, ze to nie jest Parent to musze wyjsc w gore i zamienic p & i na odpowiednie indexy, etc.

   Calosc dziala tak, ze gdy tylko natrafiam na element to sprawdzam jego behavior za pomoca instanceof a nastepnie sprawdzam typ jesli istnieje.

   Jak chce rozwiazac przypadki graniczne? To znaczy jak konczy mi sie tablica to co robie? Jesli to IF/FOR to powinienem isc w gore i odpowiednie ustawic index. Natomiast jesli to Parent to chce zwrocic null?
###
