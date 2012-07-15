#
# @require:
#   number: fest/generator/number.
#



#
# Tests performance of assigning items to array.
#
performance '/array.assign'



#
# Based on number of properties to assign.
#
performance 'length'

  ' 1 length':
    before_each: -> @a = []
    run: -> @a[0] = 0
    

  ' 3 length':
    before_each: -> @a = []
    run: -> @a[0] = 0; @a[1] = 1; @a[2] = 2


  ' 5 length':
    before_each: -> @a = []
    run: -> @a[0] = 0; @a[1] = 1; @a[2] = 2; @a[3] = 3; @a[4] = 4


  '10 length':
    before_each: -> @a = []
    run: ->
      @a[0] = 0; @a[1] = 1; @a[2] = 2; @a[3] = 3; @a[4] = 4
      @a[5] = 5; @a[6] = 6; @a[7] = 7; @a[8] = 8; @a[9] = 9

  '25 length':
    before_each: -> @a = []
    run: ->
      @a[0] = 0;   @a[1] = 1;   @a[2] = 2;   @a[3] = 3;   @a[4] = 4
      @a[5] = 5;   @a[6] = 6;   @a[7] = 7;   @a[8] = 8;   @a[9] = 9
      @a[10] = 10; @a[11] = 11; @a[12] = 12; @a[13] = 13; @a[14] = 14
      @a[15] = 15; @a[16] = 16; @a[17] = 17; @a[18] = 18; @a[19] = 19
      @a[20] = 20; @a[21] = 21; @a[22] = 22; @a[23] = 23; @a[24] = 24



#
# Assigning via push versus direct assign.
#
performance 'type'

  'direct':
    before_each: -> @a = []
    run:         -> @a[0] = 0; @a[1] = 1; @a[2] = 2; @a[3] = 3; @a[4] = 4


  'push':
    before_each: -> @a = []
    run:         -> @a.push(0); @a.push(1); @a.push(2); @a.push(3); @a.push(4)



#
# Continously assigning properties to the array.
#
performance 'cache'
  before: ->
    @a = []
    @k = number.array(200000)


  '     10 range': (i) -> @a[@k[i % 10]] = i


  '     50 range': (i) -> @a[@k[i % 50]] = i


  '    250 range': (i) -> @a[@k[i % 250]] = i


  '  1 000 range': (i) -> @a[@k[i % 1000]] = i


  '  2 500 range': (i) -> @a[@k[i % 2500]] = i


  ' 10 000 range': (i) -> @a[@k[i % 10000]] = i


  '100 000 range': (i) -> @a[@k[i % 100000]] = i



#
# Continously assigning properties to the array.
#
# Please note that these tests do not access additional array storing
# keys for caching. That results in over 8x faster caching single item.
#
performance 'cache_no_keys'
  before: ->
    @a = []
    @k = number.array(200000)


  '     10 range': (i) -> @a[i % 10] = i


  '     50 range': (i) -> @a[i % 50] = i


  '    250 range': (i) -> @a[i % 250] = i


  '  1 000 range': (i) -> @a[i % 1000] = i


  '  2 500 range': (i) -> @a[i % 2500] = i


  ' 10 000 range': (i) -> @a[i% 10000] = i


  '100 000 range': (i) -> @a[i % 100000] = i
