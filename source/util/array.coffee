#
# TODO
# Currently I do have some utils for handling unsorted arrays
# What I need is to also handle sorted arrays - insert,erase & indexOf.
# Of cource indexOf for sorted arrays is bsearch, etc.
return array =



  # * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
  #
  # Utilities for unsorted array manipulation.
  #
  # * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *



  #
  # Erases and returns first instance of the given item from the
  # array. Compares items via '===' - references only. For comparing
  # other content use erase_cst which takes a selector argument
  #
  # @param arr   {Array}
  # @param item  {*}
  #
  # @return      {*}
  #
  erase: (arr, item) ->
    i = arr.indexOf(item)
    
    return arr.splice(i, 1)[0] if i isnt -1
    return undefined


  #
  # Erases and returns first instance of the given item from the array
  # using a custom selector.
  #
  # @param arr       {Array}
  # @param selector  {(*) -> Boolean}
  #
  # @return          {*}
  #
  erase_cst: (arr, selector) ->
    i = array.indexOf(arr, selector)
    
    return arr.splice(i, 1)[0] if i isnt -1
    return undefined


  #
  # Erases all instances of the given item from the array. Compares
  # items via '===' - references only. For comparing other content 
  # use erase_cst which takes a selector argument.
  #
  # @param arr   {Array}
  # @param item  {*}
  #
  erase_all: (arr, item) ->
    l = arr.length
    arr.splice(l, 1) while l-- when arr[l] is item
        

  #
  # Erases all instances of the given item from the array using
  # a custom selector.
  #
  # @param arr       {Array}
  # @param selector  {(*) -> Boolean}
  #
  erase_all_cst: (arr, selector) ->
    l = arr.length
    arr.splice(l, 1) while l-- when selector(arr[l])


  #
  # Returns the first position of the item matched by the given
  # selector or -1 if no item was matched.
  #
  # @param arr       {Array}
  # @param selector  {(*) -> Boolean}
  #
  indexOf: (arr, selector) ->
    i = -1
    l = arr.length

    return i while i++ < l when selector(arr[i])
    return -1


  #
  # Returns the last position of the item matched by the given
  # selector or -1 if no item was matched.
  #
  # @param arr       {Array}
  # @param selector  {(*) -> Boolean}
  #
  lastIndexOf: (arr, selector) ->
    l = arr.length

    return l while l-- when selector(arr[l])
    return -1


  #
  # Shuffles the given array and returns it to the client.
  #
  # @param arr  {Array}
  # @return     {Array}
  #
  shuffle: (arr) ->
    i = arr.length

    while i--
      v = arr[i]
      j = F.random(i)
      arr[i] = arr[j]
      arr[j] = v
    return arr



  # * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
  #
  # Utilities for array projection.
  #
  # * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *



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
