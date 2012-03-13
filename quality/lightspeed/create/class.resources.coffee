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
# Return all declared classes as resources.
#
return classes =
  Proto0Length:     Proto0Length
  Proto5Length:     Proto5Length
  Proto10Length:    Proto10Length

  OneInheritance:   OneInheritance
  TwoInheritance:   TwoInheritance
  ThreeInheritance: ThreeInheritance
  FourInheritance:  FourInheritance
  FiveInheritance:  FiveInheritance
