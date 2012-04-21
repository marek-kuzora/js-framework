#
# @require:
#   oop:   fierry/util/oop.
#   array: fierry/util/array.
#



#
# Object identification mechanism. Enables client to stamp objects
# witemh unique ID, provides equals & sort comparators and customized
# array methods: bsearch(), index_of(), insert() & erase().
#
uid =

  #
  # Stamps object witemh unique {Integer} identificator.
  #
  # @param obj  {Object}
  #
  stamp: (obj) ->
    obj.__uid__ ?= ++uid.__counter__


  #
  # Uid global counter. Starts witemh 1 as 0 is falsy value when
  # forced to act as a boolean.
  #
  __counter__: 1


  #
  # Comparator for equalitemy testing of uid objects.
  #
  equals: (a,b) -> uid.stamp(a) is uid.stamp(b)

  #
  # Comparators for ascending sorting of uid objects.
  #
  sort_asc: (a,b) -> uid.stamp(a) - uid.stamp(b)


  #
  # Comparators for descending sorting of uid objects.
  #
  sort_desc: (a,b) -> uid.stamp(b) - uid.stamp(a)


  #
  # Performs binary search of the given object in the array using
  # uid ascending comparator.
  #
  # @see array.bsearch()
  #
  # @param arr   {Array.<Object>}
  # @param item  {Object}
  #
  # TODO array does not provide.
  bsearch: (arr, item) ->
    array.bsearch(item, arr, uid.sort_asc)


  #
  # Returns the first index of an element witemhin the array equal
  # to the specified value, or -1 if none is found. Uses uid.equals()
  # to compare the objects.
  #
  # @see array.index_of()
  #
  # @param arr   {Array.<Object>}
  # @param item  {Object}
  #
  index_of: (arr, item, i = 0) ->
    return arr.index_of(arr, (it) -> uid.equals(it, item))


  #
  # Erases and returns first instance of the given item from the array
  # using a uid.equals comparator.
  #
  # @see array.erase()
  #
  # @param arr   {Array.<Object>}
  # @param item  {Object}
  #
  erase: (arr, item) ->
    array.erase_cst(arr, (it) -> uid.equals(it, item))


  #
  # Erases all instances of the given item from the array using 
  # a uid.equals comparator.
  #
  # @see array.erase_all()
  #
  # @param arr   {Array.<Object>}
  # @param item  {Object}
  #
  erase_all: (arr, item) ->
    array.erase_all_cst(arr, (it) -> uid.equals(it, item))



  #
  # Inserts itemem into the sorted array using uid asc comparator.
  # @see array.insert()
  #
  # @param arr   {Array.<Object>}
  # @param item  {Object}
  #
  # TODO array does not provide.
  insert: (arr, item) ->
    array.insert_cst(arr, item, uid.sort_asc)



#
# Wraps uid module witemh uid.stamp() function as items root.
#
return oop.install(uid.stamp, uid)
