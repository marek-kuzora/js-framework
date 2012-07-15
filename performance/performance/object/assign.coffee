#
# @require:
#   string: fest/generator/string.
#

#
# Tests performance of assigning properties to object.
#
performance '/object.assign'



#
# Based on number of properties to assign.
#
performance 'length'

  ' 1 length':
    before_each: -> @o = {}
    run: -> @o.a = 0
    

  ' 3 length':
    before_each: -> @o = {}
    run: -> @o.a = 0; @o.b = 1; @o.c = 2


  ' 5 length':
    before_each: -> @o = {}
    run: -> @o.a = 0; @o.b = 1; @o.c = 2; @o.d = 3; @o.e = 4


  '10 length':
    before_each: -> @o = {}
    run: ->
      @o.a = 0; @o.b = 1; @o.c = 2; @o.d = 3; @o.e = 4
      @o.f = 5; @o.g = 6; @o.h = 7; @o.i = 8; @o.j = 9


  '25 length':
    before_each: -> @o = {}
    run: ->
      @o.a = 0; @o.b = 1; @o.c = 2; @o.d = 3; @o.e = 4; @o.f = 5; @o.g = 6
      @o.h = 7; @o.i = 8; @o.j = 9; @o.k = 10; @o.l = 11; @o.m = 12
      @o.n = 13; @o.o = 14; @o.q = 15; @o.p = 16; @o.r = 17; @o.s = 18
      @o.t = 19; @o.u = 20; @o.w = 21; @o.x = 22; @o.y = 23; @o.z = 24



#
# Dynamic assigning via string versus static assign.
#
performance 'type'
  
  'dynamic':
    before_each: -> @o = {}
    run: -> @o['a'] = 0; @o['b'] = 1; @o['c'] = 2; @o['d'] = 3; @o['e'] = 4

  'static':
    before_each: -> @o = {}
    run: -> @o.a = 0; @o.b = 1; @o.c = 2; @o.d = 3; @o.e = 4



#
# Continously assigning properties to the object.
#
performance 'cache'
  before: ->
    @o = {}
    @k = string.array(100000, 5)


  '     10 range': (i) -> @o[@k[i % 10]] = i


  '     50 range': (i) -> @o[@k[i % 50]] = i


  '    250 range': (i) -> @o[@k[i % 250]] = i

  
  '  1 000 range': (i) -> @o[@k[i % 1000]] = i


  '  2 500 range': (i) -> @o[@k[i % 2500]] = i


  ' 10 000 range': (i) -> @o[@k[i % 10000]] = i


  '100 000 range': (i) -> @o[@k[i % 100000]] = i
