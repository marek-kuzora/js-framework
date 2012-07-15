#
# @require:
#   notifier:  fierry/emitter/notifier
#
#   Emitter:   fierry/emitter/emitter
#   Primitive: fierry/model/primitive
#   Reference: fierry/model/reference
#
#   MODEL:     fierry/model/constants.MODEL
#   REFERENCE: fierry/model/constants.REFERENCE
#
#



return class Accessor extends Emitter

  #
  # Basic accessor constructor. It receives the model type, value,
  # accessor's parent & the world accessor instance. When creating 
  # a world accessor, the parent & world parametrs are expected to 
  # be undefined.
  #
  constructor: (@type_, @value_, @parent_, @world_ = @) ->
    @curr_  = []
    @prev_  = []
    @counter_ = 0

    # Handling complex types.
    if @type_.outer and @type_.inner
      @inner_ = @type_.inner
      @type_  = @type_.outer


  get_inner_type: ->
    return @inner_


  #
  # Returns the model instance wrapped by the accessor. When no model
  # is found, creates it lazily according to the following rules:
  #
  # 1. Retrieves the model class definition.
  # 2. Enhances the value using type.ENHANCE() method.
  # 3. Creates the model passing def() method, value & accessor.
  # 4. Assign the world instance to the model.
  #
  # @return model  {Object}
  #
  get: =>
    if not @model_
      type = if F.is(MODEL, @type_) then @type_ else @type_(@value_)
      
      @model_ = new type(@def, type.ENHANCE(@value_), @)
      @model_.world = @world_.get

    return @model_


  #
  # Sets new value into the accessor. This operation will detach the
  # model (forcing model recreation on next access), mark existing
  # accessors as outdated & registers itself for asynchronous
  # notification.
  #
  # @param value  {*}
  #
  set: (value) =>
    @value_ = value
    @model_ = undefined

    @fire_change()


  fire_change: ->
    @prev_ = @prev_.concat(@curr_)
    @curr_ = []

    @counter_++
    notifier().register(@) if not @emitter_disabled_

    

  #
  # Creates a child accessor of the given type and value using the
  # following rules:
  #
  # 1. Returns Primitive accessor for type is one of the following:
  #   - String
  #   - Number
  #   - Boolean
  # 2. Returns Reference accessor for reference function type.
  # 3. Returns Standard accessor for static or dynamic model type.
  # 4. Returns Custom accessor for complex type (e.g. array).

  # 5. Adds the accessor to the existing accessors collection.
  # 6. Assigns set() as a child of accessors get() & return get().
  #
  # @param type   {Object}
  # @param value  {*}
  #
  def: (type, value) =>

    if F.is_function(type)

      if type is Boolean or type is Number or type is String
        acc = new Primitive(value)

      else if F.is(REFERENCE, type)
        acc = new Reference(type, value, @)

      else
        acc = new Accessor(type, value, @, @world_)

    else

      if type.inner and type.outer
        acc = new Accessor(type, value, @, @world_)

      else
        throw new Error 'Unsupported type format given.'

    @curr_.push(acc)
    
    acc.get.set = acc.set
    return acc.get


  #
  # Notifies the subscribed listeners and the child accessors that 
  # a change occured. For performance reasons, this emitter will not
  # provide data what has changed, or why the listener is invoked.
  #
  # @param visited  {Array.<Boolean>}  array of already invoked
  #                                    listeners by their uids.
  #
  notify: (visited) ->
    super(visited)
    a.notify(visited) for a in @prev_
    @prev_ = []
