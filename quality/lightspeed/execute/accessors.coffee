#
# Load resources for this test: will trigger registering additional
# modules into the application.
#
F.run('fierry-qa/lightspeed/execute/accessors.resources')



#
# Test module accessors execution time.
#
lightspeed '/execute.accessors'

  'require': (i) ->
    F.require('module.with.api') while i--
    return


  'execute -with-api': (i) ->
    module = F.require('module.with.api')

    module() while i--
    return


  'execute -no-api': (i) ->
    module = F.require('module.with.undefined')

    module() while i--
    return
