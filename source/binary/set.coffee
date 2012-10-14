#
# @require:
#   BTree:            fierry/binary/tree
#   PreOrderIterator: fierry/binary/pre_order_iterator
#   InOrderIterator:  fierry/binary/in_order_iterator
#



UID_KEY = (value) -> F.uid(value)


return class BSet

  constructor: (@get_key_) ->
    @length = 0
    
    @array_ = []
    @maximum_ = 0
    @get_key_ ?= UID_KEY


  add: (value) ->
    key = @get_key_(value)

    # Push the element if key is outside the maximum range.
    if key > @maximum_
      @array_.push(new BTree(key, value))

      # Increment the length.
      @length++

      # Update the maximum range and return
      @maximum_ = key
      return true

    # Get the position index from binary search.
    i = @binary_search_(key)
    i = -(i + 1) if i < 0
   
    # Try to add the element to the BTree.
    if @array_[i].add(key, value)

      # Increment the length.
      @length++
      return true

    return false


  # TODO foreach wouldn't be faster ??
  add_all: (collection) ->

    # Get the collection's iterator.
    it = collection.iterator()

    # Add all values iterating over the collection.
    @add(value) while value = it.next()
    return


  contains: (value) ->
    key = @get_key_(value)

    # Returns false if the key is outside the maximum range.
    return false if key > @maximum_

    # Get the position index from binary search.
    i = @binary_search_(key)

    # Returns if the key is found inside the set.
    return i >= 0 and @array_[i].contains(key)


  #
  # Returns iterator for traversing through the set. If sort parameter
  # was given, returns in-order iterator, otherwise returns pre-order
  # iterator.
  #
  # @param sort  {Boolean}
  # 
  iterator: (sort = true)->
    return new PreOrderIterator(@array_) if not sort
    return new InOrderIterator(@array_)


  each: (fn) ->
    tree.each(fn) for tree in @array_
    return


  remove: (value) ->
    key = @get_key_(value)

    # Return if the key is outside the maximum range.
    return false if key > @maximum_

    # Get the position index from binary search.
    i = @binary_search_(key)

    # Return if position is negative.
    return false if i < 0

    # Remove the element if it was found.
    if @array_[i].remove(key)

      # Decrement the length.
      @length--
      return true

    return false


  #
  # Performs standard binary search.
  #
  # @param key  {String}
  # @return     {Number}
  #
  binary_search_: (key) ->
    l = 0
    h = @array_.length - 1

    while l <= h
      mid = l + h >> 1
      val = @array_[mid]

      if key > val.maximum_ then l = mid + 1
      else if key < val.minimum_ then h = mid - 1
      else return mid

    return -(l + 1)
