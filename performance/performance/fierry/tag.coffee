performance '/fierry.tag'

  'tag':
    before_each: -> @h = {}
    run:         -> F.tag('label', @h)

  'tag -multiple':
    before_each: -> @h = {}
    run:         -> F.tag('label', 'second-label', @h)

  'tag -additional':
    before_each: -> @h = F.tag('label', {})
    run:         -> F.tag('second-label', @h)


  'is -tagged':
    before: -> @h = F.tag('label', {})
    run:    -> F.is('label', @h)


  'is -untagged':
    before: -> @h = {}
    run:    -> F.is('label', @h)

