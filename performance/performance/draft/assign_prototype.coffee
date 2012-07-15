#
# Tests creating function with a different prototype execution time.
# The prototype has 15 items inside.
#
performance '/draft.assign_prototype'

  #
  # The best method found so far. It will not work on IE. Waiting for 
  # Object.setPrototypeOf() method to be added to Harmony project.
  #
  'highjack': (i) ->
    p = {
      a: 1, b: 1, c: 1, d: 1, e: 1; f: 1, g: 1, h: 1
      i: 1, j: 1, m: 1, n: 1, o: 1, p: 1, r: 1
    }
    while i--
      f = ->
      f.__proto__ = p
    return


  #
  # This method behaves exactly as assigning multiple properties to 
  # an object. Performance will decline greatly with the increase of 
  # number of items in the prototype.
  #
  'manual': (i) ->
    while i--
      f = ->
      f.a = 1; f.b = 1; f.c = 1; f.d = 1; f.e = 1; f.f = 1; f.g = 1; f.h = 1
      f.i = 1; f.j = 1; f.m = 1; f.n = 1; f.o = 1; f.p = 1; f.r = 1
    return


  'auto': (i) ->
    p = {
      a: 1, b: 1, c: 1, d: 1, e: 1; f: 1, g: 1, h: 1
      i: 1, j: 1, m: 1, n: 1, o: 1, p: 1, r: 1
    }
    while i--
      f = ->
      f[k] = v for k, v of p
    return


  'Object defineProperties': (i) ->
    p = {
      a: value: 1, b: value: 1, c: value: 1, d: value: 1, e: value: 1
      f: value: 1, g: value: 1, h: value: 1, i: value: 1, j: value: 1
      m: value: 1, n: value: 1, o: value: 1, p: value: 1, r: value: 1
    }
    while i--
      f = ->
      Object.defineProperties(f, p)
    return

