#
# Module providing utilities for sorted or unsorted array manipulation
# as well as some additional utilities for array projection.
#
return self =

  #
  # Removes and returns first instance of the given item from the
  # array. Compares items via '===' - references only.
  #
  # @param array  {Array}
  # @param item   {*}
  #
  # @return       {*}
  #
  remove: (array, item) ->
    i = array.indexOf(item)
    
    return array.splice(i, 1)[0] if i isnt -1
    return undefined


  #
  # Removes all instances of the given item from the array. 
  # Compares items via '===' - references only. For comparing other
  # content use filter_out() which takes a selector argument. 
  # Please note that this method iterates backwards, from the last
  # element to the first.
  #
  # @param array  {Array}
  # @param item   {*}
  #
  remove_all: (array, item) ->
    l = array.length
    array.splice(l, 1) while l-- when array[l] is item


  #
  # Returns all items that satisfies the given selector.
  #
  # @param array     {Array}
  # @param selector  {(*) -> Boolean}
  # @return          {Array}
  #
  filter: (array, selector) ->
    return array.filter(selector)


  #
  # Removes all references of the given item from the array using
  # a custom selector.
  #
  # The selector should return true whenever the given item
  # matches - that item will be removed. Please note that this
  # method iterates backwards, from the last element to the first.
  #
  # @param array     {Array}
  # @param selector  {(*) -> Boolean}
  #
  filter_out: (array, selector) ->
    l = array.length
    array.splice(l, 1) while l-- when selector(array[l])
    return

  #
  # Shuffles the given array and returns it to the client.
  #
  # @param arr  {Array}
  # @return     {Array}
  #
  shuffle: (arr) ->
    l = ll = arr.length

    while ll--
      i = F.random(l-1)
      j = F.random(l-1)

      v = arr[i]
      arr[i] = arr[j]
      arr[j] = v
    return arr


  #
  # Removes additional dimention from the given array, if the array is
  # multidimensional. Having a String[][] array this utility would
  # produce String[] that contains all its array elements concatenated
  # together.
  #
  # @param arr  {Array}
  #
  flatten: (arr) ->
    result = []
    return result.concat(result, array)


  #
  # Returns array with unique (not duplicated) items from the given
  # one. Will work only for arrays containing strings and numbers.
  #
  # @param arr  {Array}
  # @return     {Array}
  #
  unique: (arr) ->
    h = {}
    h[i] = true for i in arr
    return (k for k of h)



  # * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
  #
  # Utilities for sorted array manipulation.
  #
  # * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *


  
  #
  # Performs binary search on sorted array. Returns index of 
  # the found key or negative value if key wasn't found. 
  # Having negative value, one can obtain index where to insert
  # that key to retain the sorted order: index = -1 * (value+1).
  #
  # Compares items via '<' - primitives only. For comparing
  # other content use bsearch_cst() which takes a selector argument.
  #
  # @param arr  {Array}
  # @param key  {*}
  # @return     {Number}
  #
  bsearch: (arr, key) ->
    l = 0
    h = arr.length - 1

    while l <= h
      mid = l + h >> 1
      mval = arr[mid]

      if mval < key then l = mid + 1
      else h = mid - 1

    if mval is key then return mid
    else return -(l+1)


  #
  # Performs binary search on sorted array. Returns index of 
  # the found key or negative value if key wasn't found. 
  # Having negative value, one can obtain index where to insert
  # that key to retain the sorted order: index = -1 * (value+1).
  # @see array.bsearch()
  #
  # @param Array arr
  # @param Any key
  # @param Function fn 
  #     - comparator, that should return -1 if a < b
  #
  bsearch_cst: (arr, key, fn) ->
    l = 0
    h = arr.length - 1

    while l <= h
      mid = l + h >> 1
      mval = arr[mid]

      if fn(mval, key) < 0 then l = mid + 1
      else h = mid - 1

    if mval is key then return mid
    else return -(l+1)


  #
  # Inserts item into the sorted array. Compares items via '<'
  # - primitives only. For comparing other content use
  # insert_cst() which takes a selector argument.
  #
  # To workaround Chrome bug of native Array.splice() function,
  # the index is explicitly casted into primitive integer.
  #
  # @param arr  {Array}
  # @param it   {*}
  #
  insert: (arr, it) ->
    i = array.bsearch(arr, it)
    i = -1 * (i + 1) if i < 0
    arr.splice(~~i, 0, it)


  #
  # Inserts item into the sorted array using a custom selector.
  # @see array.insert()
  #
  # @param Array arr
  # @param Any it
  # @param Function fn 
  #     - comparator, that should return -1 if a < b
  #
  insert_cst: (arr, it, fn) ->
    i = array.bsearch_cst(arr, it, fn)
    i = -1 * (i + 1) if i < 0
    arr.splice(~~i, 0, it)
