#
# Register module that will return '21' as its API.
#
F.register_module('module.with.api', (-> 21))



#
# Register module that will return 'undefined' as its API.
#
F.register_module('module.with.undefined', (->))
