#
# Classes based on prototype length.
#
class Proto0Length

class Proto5Length
  a: 0, b: 1, c: 2, d: 3, e: 4

class Proto10Length
  a: 0, b: 1, c: 2, d: 3, e: 4, f: 5, g: 6, h: 7, i: 8, j: 9



#
# Classes based on inheritance.
#
class OneInheritance extends Proto0Length

class TwoInheritance extends OneInheritance

class ThreeInheritance extends TwoInheritance

class FourInheritance extends ThreeInheritance

class FiveInheritance extends FourInheritance



#
# Classes based on inheritance without default constructor
#
class OneInheritanceNC extends Proto0Length
  constructor: ->

class TwoInheritanceNC extends OneInheritance
  constructor: ->

class ThreeInheritanceNC extends TwoInheritance
  constructor: ->

class FourInheritanceNC extends ThreeInheritance
  constructor: ->

class FiveInheritanceNC extends FourInheritance
  constructor: ->



#
# Classes based on number of properties created in constructor.
#
class Property1Length
  constructor: ->
    @a = 0

class Property3Length
  constructor: ->
    @a = 0; @b = 1; @c = 2

class Property5Length
  constructor: ->
    @a = 0; @b = 1; @c = 2; @d = 3; @e = 4

class Property10Length
  constructor: ->
    @a = 0; @b = 1; @c = 2; @d = 3; @e = 4
    @f = 5; @g = 6; @h = 7; @i = 8; @j = 9

class Property25Length
  constructor: ->
    @a = 0; @b = 1; @c = 2; @d = 3; @e = 4; @f = 5; @g = 6; @h = 7; @i = 8
    @j = 9; @k = 10; @l = 11; @m = 12; @n = 13; @o = 14; @q = 15; @p = 16
    @r = 17; @s = 18; @t = 19; @u = 20; @w = 21; @x = 22; @y = 23; @z = 24



#
# Classes based on type of properties created in constructor.
#
class PropertyInt
  constructor: ->
    @a = 0; @b = 1; @c = 2; @d = 3; @e = 4

class PropertyString
  constructor: ->
    @a = 'a'; @b = 'b'; @c = 'c'; @d = 'd'; @e = 'e'

class PropertyHash
  constructor: ->
    @a = {}; @b = {}; @c = {}; @d = {}; @e = {}

class PropertyArray
  constructor: ->
    @a = []; @b = []; @c = []; @d = []; @e = []

class PropertyFunction
  constructor: ->
    @a = (->); @b = (->); @c = (->); @d = (->); @e = (->)



#
# Return all declared classes as resources.
#
return classes =
  Proto0Length:       Proto0Length
  Proto5Length:       Proto5Length
  Proto10Length:      Proto10Length

  OneInheritance:     OneInheritance
  TwoInheritance:     TwoInheritance
  ThreeInheritance:   ThreeInheritance
  FourInheritance:    FourInheritance
  FiveInheritance:    FiveInheritance

  OneInheritanceNC:   OneInheritanceNC
  TwoInheritanceNC:   TwoInheritanceNC
  ThreeInheritanceNC: ThreeInheritanceNC
  FourInheritanceNC:  FourInheritanceNC
  FiveInheritanceNC:  FiveInheritanceNC

  Property1Length:    Property1Length
  Property3Length:    Property3Length
  Property5Length:    Property5Length
  Property10Length:   Property10Length
  Property25Length:   Property25Length

  PropertyInt:        PropertyInt
  PropertyString:     PropertyString
  PropertyHash:       PropertyHash
  PropertyArray:      PropertyArray
  PropertyFunction:   PropertyFunction
