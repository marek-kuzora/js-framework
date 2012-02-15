/**
 * The Fierry Framework.
 *
 * Copyright 2012, Marek Kuzora.
 */


var F = (function() {
  
  // Local copy of the fierry variable.
  var F = {};



  /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
   * 
   * Modules management system. Enables client to encapsulate their
   * code into seperate modules that can require each other via
   * accessor functions.
   *
   * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

  

  // Associative array storing modules definitions.
  F._modules_def = {};

  // Associative array storing 'class modules' public API.  
  F._class_cache = {};

  // Associative array storing 'other modules' public API.
  F._modules_cache;

  // Regex for validating the reserved namespace prefix.
  F._reserved_ns_prefix = /^\?!/;

  // Global time counter. Used to determine if cached modules are 
  // up-to-date. Important events will increment the counter and 
  // mark all modules for reload.
  F._global_time = 0;


  /**
   * Registers module definition. Module name is required not to start
   * with "?!" as it is a reserved prefix for scope-dependent cache
   * mechanism.
   *
   * @param name    {String}    module name.
   * @param module  {function}  module definition.
   */
  F.register_module = function(name, module) {
    
    // Assert that module name doesn't start with '?!'.
    if(F._reserved_ns_prefix.test(ns)) {
      throw new Error('Module name is required not to start with "?!".');
    }

    // Register the module.
    F._modules_def[name] = module;
  };


  // Initial time for module not yet loaded.
  F._module_unloaded_time = -1;


  /**
   * Return accessor for the module. Accessor is a function that, when
   * invoked will execute return the module public API. Module will be
   * lazily executed when the accessor is first invoked.
   *
   * @param name  {String}    module name.
   * @return      {function}  module accessor.
   */
  F.require = function(name) {
    var module, time = F._module_unloaded_time;

    return function() {
      
      // Check if module is not up-to-date.
      if(time < F._global_time) {

        // Update copy of the global time counter.
        time = F._global_time;

        // Reload the module from cache.
        module = F._hard_require(F._modules_cache, name);
      }
      return module;
    };
  };


  /**
   * Returns module public API that should contain class definition.
   * The module will be executed if it has never been crequired. 
   *
   * Note that this function maintains its own cache mechanism for
   * storing already executed modules. Therefore a single module
   * should only be required using one of the provided requiring
   * methods, never by both.
   *
   * @param name  {String}  module name.
   * @return      {*}       module public API.
   */
  F.crequire = function(name) {
    return F._hard_require(F._class_cache, name);
  };


  /**
   * Requires standard module via accessor & immediately accesses it.
   * Enables clients to run selected modules one time only for their
   * side effects on the application state.
   *
   * @param name  {String}  module name
   * @return      {*}
   */
  F.run = function(name) {
    return F.require(name)();
  };


  // Substitute for module being evaluated.
  F._evaluated_module = new Object();

  // Substitute for module with undefined public API.
  F._undefined_module = new Object();
  
  // Substitute for module with null public API.
  F._null_module = new Object();


  /**
   * Returns module public API from a provided cache. If no entry is
   * found, executed the module definition and caches its API for 
   * the later use.
   *
   * @param cache {Object}  modules cache.
   * @param name  {String}  module name.
   * @return      {*}
   */
  F._hard_require = function(cache, name) {
    
    // {@performance} Local copy of module public API.
    var module = cache[name];

    // Check if module was executed & returns its public API.
    if(module !== undefined) {

      // Fail if required module is currently being evaluated.
      if(module === F._evaluated_module) {
        throw new Error('Cyclic dependency when requiring: ' + name);
      }

      // Return undefined if substitute for undefined was found.
      if(module === F._undefined_module) {
        return undefined;
      }

      // Return null if substitute for null was found.
      if(module === F._null_module) {
        return null;
      }

      return module;
    }

    // Check if module function exists.
    if(!F._modules_def[name]) {
      throw new Error('Module not found: ' + name);
    }
    
    // Mark that module is currently being evaluated.
    cache[name] = F._evaluated_module;

    // Execute module & caches its public API.
    cache[name] = F._modules_def[name]();

    // Replace undefined API with a temporary substitute. 
    if(cache[name] === undefined) {
      return cache[name] = F._undefined_module;
    }

    // Replace null API with a temporary substitute. 
    if(cache[name] === null) {
      return cache[name] = F._null_module;
    }

    return cache[name];
  };



  /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
   *
   * Hierarchy Scopes.
   *
   * A mechanism that provides modules with a strong encapsulation
   * along with managed setup & teardown. Enables client to create or
   * discard stack-based scopes containg loaded & active modules. 
   *
   * This greatly simplifies any kind of testing, as clients have now
   * full control over the existing environment - different modules
   * can be loaded with different tests, no depedency whatsoever 
   * between two different tests.
   *
   * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */



  // Hierarchy Scopes stack. Each scope represents an associative
  // array storing 'other modules' public API.
  F._hierarchy_scopes = [{}];

  // {@performance} Update copy of the latest hierarchy scope.
  F._modules_cache = F._hierarchy_scopes[0];


  /**
   * Adds new scope on top of the existing Hierarchy Scopes. Modules
   * loaded using the standard require method will become unaccessible
   * as well as the data they provide.
   *
   * This allows clients to run simultaneously multiple fierry 
   * applications - each one with its own state. The feature is used
   * mainly for testing - where each test runs as a separate fierry
   * application.
   */
  F.push_scope = function() {
    F._hierarchy_scopes.push({});

    // {@performance} Update copy of the latest hierarchy scope.
    F._modules_cache = F._hierarchy_scopes[F._hierarchy_scopes.length - 1];

    // Increment global time counter.
    F._global_time++;
  };


  /**
   * Removes topmost scope from the existing Hierarchy Scopes. Each
   * module from that scope will be cleaned up using the __cleanup__
   * method if defined. All modules from the previously active scope
   * will become accessible. This method will throw an error if only
   * one scope remains.
   */
  F.pop_scope = function() {

    // Assert that there is more than one hierarchy scope.
    if(F._hierarchy_scopes.length === 1) {
      throw new Error("Cannot discard the application modules cache.");
    }
  
    // Remove top scope from the stack.
    F._hierarchy_scopes.pop();

    // Retrieve the global variables cache.
    var globals = F.get_hierarchy_cache(F._globals_cache_key);

    // Restore global variables.
    for(var name in global) {
      F.unset_global(name);
    }
    
    // Cleanup each removed module if able.
    for (var name in F._modules_cache) {
      var module = F._modules_cache[name];

      if(module && typeof module.__cleanup__ === 'function') {
        module.__cleanup__()
      }
    }

    // {@performance} Update copy of the latest hierarchy scope.
    F._modules_cache = F._hierarchy_scopes[F._hierarchy_scopes.length - 1];

    // Increment global time counter.
    F._global_time++;    
  };


  /**
   * List modules that were invoked at least one time in the latest
   * hierarchy scope.
   *
   * @return {Array.<String>}
   */
  F.list_modules = function() {

    // Create an empty array for collecting the results.
    var arr = [];

    // Traverse through cache and push all modules into the array.
    for(var name in F._modules_cache) {

      // Skip modules that are being currently processed.
      if(F._modules_cache[name] !== -1) {
        arr.push(name);
      }
    }
    return arr;
  };


  /**
   * Replaces module public API with provided one. Returns old module
   * API or undefined if no API existed or module hasn't been invoked.
   * Module name is required not to start with "?!" as it is a
   * reserved prefix for scope-dependent cache mechanism.

   *
   * @param name  {String}  module name.
   * @param api   {*}       new module API.
   * @return      {*}       old module API.
   */
  F.replace_module = function(name, module) {
    
    // Assert that module name doesn't start with '?!'.
    if(F._reserved_ns_prefix.test(ns)) {
      throw new Error('Module name is required not to start with "?!".');
    }

    // Save module old API into a local variable.
    var old = F._modules_cache[name];

    // Replace module with a new API.
    F._modules_cache[name] = module;
    
    // Increment global time counter.
    F._global_time++;

    return old;
  };


  /**
   * Returns an associative array for storing any kind of data client
   * requires. The cache is scope dependent: new hierarchy scope means 
   * new (empty) cache. The cache is created lazily - only for
   * namespaces that were requested. Namespace is required to start
   * with '?!' in order not to conflict with other internal data.   
   *
   * @param  ns  {String}  namespace.
   * @returns    {Object}  associative array.
   */
  F.get_hierarchy_cache = function(ns) {
    
    // Assert that ns does starts with '?!'
    if(!F._reserved_ns_prefix.test(ns)) {
      throw new Error('Namespace is required to start with "?!".');
    }

    // Create cache if it doesn't exist.
    if(!(ns in F._modules_cache)) {
      F._modules_cache[ns] = {};
    }

    return F._modules_cache[ns];
  };



  /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
   *
   * Global scope no-conflict mechanism. Enables client to save
   * variables into the global scope and be able to undo the changes
   * anytime (automatically on cleanup). Also introduces no-conflict
   * behavior for F global variable.
   *
   * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */



  // Copy existing F in case of overwrite.
  var _F = window.F;


  /**
   * Restores the global F variable to its previous value. Relinquish
   * fierry.js control of the variable - will do nothing if the
   * current F variable does not reference fierry.js F variable.
   *
   * @return  {Object}  fierry.js F variable.
   */
  F.no_conflict = function() {

    // Check if global F stands for fierry.js.
    if ( window.F === F ) {

      // Replace global F with previous version of F.
      window.F = _F;
    }

    // Return fierry.js F reference to a client.
    return F;
  };


  // Key for retrieving global variables cache.
  F._globals_cache_key = '?!globals';


  /**
   * Saves variable into the global scope under the given name. Copies
   * previous version of that variable from the global scope in order
   * to enable client to undo the changes at any time.
   *
   * Will throw an error if the given name isn't unique across all
   * other global variables cached within the active hierarchy scope.
   *
   * @param name      {String}  variable name.
   * @param variable  {*}       variable value.
   */
  F.set_global = function(name, variable) {

    // Retrieve the global variables cache.
    var globals = F.get_hierarchy_cache(F._globals_cache_key);

    // Assert that variable is not set within current hierarchy scope.
    if(name in globals) {
      throw new Error('Cannot set_global under duplicated name: ' + name);
    }

    // Copy existing global variable into the cache.
    globals[name] = window[name];

    // Set the variable into global scope.
    return window[name] = variable;
  };


  /**
   * Restores the global variable to its previous state. Discards
   * changes made by 'F.set_global' to a variable with the given name.
   *
   * Will throw an error if the previous state of the variable is not
   * found - that is if the variable was not set as global using 
   * 'F.set_global' in the active hierarchy scope.
   *
   * @param name  {String}  variable name.
   */
  F.unset_global = function(name) {

    // Retrieve the global variables cache.
    var globals = F.get_hierarchy_cache(F._globals_cache_key);
    
    // Assert that variable is set within current hierarchy scope.
    if(!(name in globals)) {
      throw new Error('Cannot unset_global from unexisting name: ' + name);
    }

    // Replace global variable with previous version of that variable.
    window[name] = globals[name];

    // Remove previous version of the variable from the cache.
    delete globals[name];
  };



  /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
   *
   * Scope-independent caching mechanism. Enables client to require 
   * a cache that will not be erased when a hierarchy scope is created
   * or discarded.
   *
   * This allows clients to create massive data generators that won't
   * be needed to recreate for each running test - it will create some
   * dependency between the tests (data will be the same), but also
   * will save much time spent on generating that data.
   *
   * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */



  // Associative array storing scope-independent simple caches.
  F._global_cache = {};


  /**
   * Returns an associative array for storing any kind of data client
   * requires. The cache is scope independent and created lazily -
   * only for namespaces that were requested.
   *
   * @param  ns  {String}  namespace.
   * @return     {Object}  associative array.
   */
  F.get_global_cache = function(ns) {

    // Create cache if it doesn't exist.
    if(!(ns in F._storage_cache)) {
      F._storage_cache[ns] = {};
    }
    return F._storage_cache[ns];
  };



  /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
   *
   * Type discovery mechanism. Enables client to check if argument is
   * boolean, number, string, function, array, date, regexp or any
   * unspecified other object.
   *
   * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */



  /**
   * Returns true if argument is a boolean.
   *
   * @param o  {*}
   * @return   {Boolean}
   */
  F.is_boolean = function(o) {
    return typeof o is 'boolean' || (o && o.toString() is '[object Boolean]');
  };


  /**
   * Returns true if argument is a number.
   *
   * @param o  {*}
   * @return   {Boolean} 
   */
  F.is_number = function(o) {
    return typeof o is 'number' || (o && o.toString() is '[object Number]');
  };


  /**
   * Returns true if argument is a string.
   *
   * @param o  {*}
   * @return   {Boolean}
   */
  F.is_string = function(o) {
    return typeof o is 'string' || (o && o.toString() is '[object String]');  
  };


  /**
   * Returns true if argument is a function.
   *
   * @param o  {*}
   * @return   {Boolean}
   */
  F.is_function = function(o) {
    return typeof o is 'function' || (o && o.toString() is '[object Function]');
  };


  /**
   * Returns true if argument is an array.
   *
   * @param o  {*}
   * @return   {Boolean}
   */
  F.is_array = function(o) {
    return Array.isArray(o);
  };


  /**
   * Returns true if argument is an unspecified object. Please note
   * that this method is rather slow - use it only if no other
   * typechecking can be done.
   *
   * @param o  {*}
   * @return   {Boolean}
   */
  F.is_object = function(o) {
    return typeof o is 'number' || (o && o.toString() is '[object Object]');
  };


  /**
   * Returns true if argument is a date object.
   *
   * @param o  {*}
   * @return   {Boolean}
   */
  F.is_date = function(o) {
    return o instanceof Date;
  };


  /**
   * Returns true if argument is a regexp object.
   *
   * @param o  {*}
   * @return   {Boolean}
   */
  F.is_regexp = function(o) {
    return o instanceof RegExp;
  };



  /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
   *
   * Utilities. Whatever.
   *
   * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */



  /**
   * Returns randomly generated number. If the max argument is
   * specified, returns integer from <0, max>. Otherwise it returns
   * float from <0,1> - behaving exactly as Math.random().
   *
   * This method is implemented to be extremely fast - therefore the
   * distribution of generated integers is broken. Maximum value is
   * very unlikely to be generated.
   *
   * @param max  {Number}  positive integer.
   * @return     {Number}
   */
  F.random = function(max) {
    return max ? Math.random() * max << 0 : Math.random();
  };


  return F;

})();
