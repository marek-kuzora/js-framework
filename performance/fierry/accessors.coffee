#
# Load resources for this test: will trigger registering additional
# modules into the application.
#
F.run('fierry-pfc/fierry/accessors-resources')



#
# Test module accessors execution time.
#
performance '/fierry.accessors'

  'require': ->  F.require('module.with.api')

  'srequire': -> F.srequire('module.with.class')

  'execute -with-api':
    before: -> @module = F.require('module.with.api')
    run:    -> @module()

  'execute -no-api':  ->
    before: -> @module = F.require('module.with.undefined')
    run:    -> @module()
