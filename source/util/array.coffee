return array =

  erase: (arr, item) ->
    idx = arr.indexOf(item)
    
    return arr.splice(idx, 1) if idx isnt -1
    return undefined

  # Byc moze lepiej wykorzystac custom indexOf? 
  erase_cst: (arr, selector) ->
    l = arr.length
    return arr.splice(l, 1)[0] while l-- when selector(arr[l])
    return undefined

  erase_all: (arr, item) ->
    l = arr.length
    arr.splice(l, 1) while l-- when arr[l] is item
        

  erase_all_cst: (arr, selector) ->
    l = arr.length
    arr.splice(l, 1) while l-- when selector(arr[l])
