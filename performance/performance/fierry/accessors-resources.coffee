#
# Register module that will return String 'API' as its API.
#
F.register_module('module.with.api', (-> return "API"))



#
# Register module that will return 'undefined' as its API.
#
F.register_module('module.with.undefined', (-> return undefined))


#
# Registers module that will return a class definition as its API.
#
F.register_module('module.with.class', (-> return class Class))
