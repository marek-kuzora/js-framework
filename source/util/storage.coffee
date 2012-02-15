#
# Wrapper around HTML5 Web Storage (specification available at: 
# http://www.w3.org/TR/webstorage/). Enables clients to retrieve, 
# save & remove any kind of data identified by a String key.
#
# Each method accepts additional Boolean argument indicating the 
# type of accessed storage. True means session storage, otherwise
# local (persistent) storage.
#
class Storage

  #
  # Retrieves the data identified by the given key. This method will
  # treat the data as JSON string & will decode it before returning 
  # to the client.
  #
  # @param key      {String}
  # @param session  {Boolean}
  # @return         {*}        data or null if not found.
  #
  get: (key, session) ->
    return JSON.parse(@_get_storage(session).getItem(key))

  #
  # Sets the data into the specified storage using the given key. 
  # This method will stringify the data using JSON format.
  #
  # @param key      {String}
  # @param value    {*}
  # @param session  {Boolean}
  #
  set: (key, value, session) ->
    @_get_storage(session).setItem(key, JSON.stringify(value))

  #
  # Removes the data identified by the given key.
  #
  # @param key      {String}
  # @param session  {Boolean}
  #
  remove: (key, session) ->
    @_get_storage(session).removeItem(key)

  #
  # Removes all the data associated with the specified storage.
  #
  # @param session  {Boolean}
  #
  clear_all: (session) ->
    @_get_storage(session).clear()
    
  #
  # Returns the session storage if the session argument was set to
  # true. Otherwise returns local (persisten) storage.
  #
  # @param session  {Boolean}
  #
  _get_storage: (session) ->
    return if session then sessionStorage else localStorage


return new Storage()
