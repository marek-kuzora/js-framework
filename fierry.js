/**
 * The Fierry Framework.
 *
 * Copyright 2012, Marek Kuzora.
 */



// Forcing strict mode.
// TODO fix issues with performance namespace to enable strict mode.
// "use strict";

// Copy the global scope from the browser or nodejs environment.
var window = this || global;



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
  F.modules_def_ = {};

  // Associative array storing 'static modules' public API.  
  F.static_cache_ = {};

  // Associative array storing 'other modules' public API.
  F.dynamic_cache_;

  // Regex for validating the reserved namespace prefix.
  F.reserved_ns_prefix_ = /^\?!/;

  // Global time counter. Used to determine if cached modules are 
  // up-to-date. Important events will increment the counter and 
  // mark all modules for reload.
  F.global_time_ = 0;


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
    if(F.reserved_ns_prefix_.test(name)) {
      throw new Error('Module name is required not to start with "?!".');
    }

    // Register the module.
    F.modules_def_[name] = module;
  };


  // Initial time for module not yet loaded.
  F.module_unloaded_time_ = -1;

  // Counter storing the F.hard_require_() recursion's depth.
  F.require_depth_ = 0;

  // Array storing pending requires from the executed modules.
  F.pending_requires_ = [];


  /**
   * Performs a dynamic require of a module with the given name.
   * Return an accessor for the module with an inner state. Accessor 
   * is a function that, when invoked will execute and return the
   * module's public API. The module won't be executed until the
   * accessor is first invoked.
   *
   * Please note that dynamic and static requires maintain their own
   * modules caching mechanism. Therefore a single module should never
   * be required both by dynamic and static require.
   *
   * @param name  {String}    module name.
   * @return      {function}  module accessor.
   */
  F.require = function(name) {
    var module, time = F.module_unloaded_time_;

    return function() {
      
      // Check if module is not up-to-date.
      if(time < F.global_time_) {
        // Update copy of the global time counter.
        time = F.global_time_;

        // Reload the module from cache.
        module = F.hard_require_(F.dynamic_cache_, name);
      }
      return module;
    };
  };


  /**
   * Performs a static require of a module with the given name.
   * Returns a public API for the module without an inner state (e.g.
   * class definition, set of functions). The module will be executed
   * if it has never been required.
   *
   * Please note that dynamic and static requires maintain their own
   * modules caching mechanism. Therefore a single module should never
   * be required both by dynamic and static require.
   *
   * @param name  {String}  module name.
   * @return      {*}       module public API.
   */
  F.srequire = function(name) {
    return F.hard_require_(F.static_cache_, name);
  };


  /**
   * Requires a module using dynamic require and immediately accesses
   * it. Enables clients to run selected modules one time only for
   * their side effects on the application state.
   *
   * @param name  {String}  module name
   * @return      {*}
   */
  F.run = function(name) {

    // Decrement the recursion's depth counter.
    F.require_depth_--;

    // Execute module & retrieve its public API.
    var module = F.require(name)();

    // Increment the recursion's depth counter.
    F.require_depth_++; 
  };


  // Substitute for module being evaluated.
  F.evaluated_module_ = new Object();

  // Substitute for module with undefined public API.
  F.undefined_module_ = new Object();
  
  // Substitute for module with null public API.
  F.null_module_ = new Object();


  /**
   * Returns module public API from a provided cache. If no entry is
   * found, executed the module definition and caches its API for 
   * the later use.
   *
   * @param cache {Object}  modules cache.
   * @param name  {String}  module name.
   * @return      {*}
   */
  F.hard_require_ = function(cache, name) {
    var requires;
    
    // Local copy of module public API.
    var module = cache[name];

    // Check if module was executed & returns its public API.
    if(module !== undefined) {

      // Fail if required module is currently being evaluated.
      if(module === F.evaluated_module_) {
        throw new Error('Cyclic dependency when requiring: ' + name);
      }

      // Return undefined if substitute for undefined was found.
      if(module === F.undefined_module_) {
        return undefined;
      }

      // Return null if substitute for null was found.
      if(module === F.null_module_) {
        return null;
      }

      // Return the module's public API.
      return module;
    }

    // Check if module function exists.
    if(!F.modules_def_[name]) {
      throw new Error('Module not found: ' + name);
    }

    // Increment the recursion's depth counter.
    F.require_depth_++;
 
    // Mark that module is currently being evaluated.
    cache[name] = F.evaluated_module_;

    // Create a hash storing the required modules.
    F.pending_requires_.push(requires = {});

    // Execute module & cache its public API.
    cache[name] = F.modules_def_[name](requires);

    // Replace undefined API with a temporary substitute. 
    if(cache[name] === undefined) {
      cache[name] = F.undefined_module_;
    }

    // Replace null API with a temporary substitute. 
    if(cache[name] === null) {
      cache[name] = F.null_module_;
    }

    // Decrement the recursion's depth counter.
    F.require_depth_--;

    // If it is the top require invocation.
    if(F.require_depth_ === 0) {

      // Satisfy the pending dependences using static require.
      while(requires = F.pending_requires_.shift()) {
        for(var key in requires) {
          requires[key] = F.srequire(requires[key])
        }
      }
    }

    // Return the module's public API.
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
  F.hierarchy_scopes_ = [{}];

  // Update copy of the latest hierarchy scope.
  F.dynamic_cache_ = F.hierarchy_scopes_[0];


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
    F.hierarchy_scopes_.push({});

    // Update copy of the latest hierarchy scope.
    F.dynamic_cache_ = F.hierarchy_scopes_[F.hierarchy_scopes_.length - 1];

    // Increment global time counter.
    F.global_time_++;
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
    if(F.hierarchy_scopes_.length === 1) {
      throw new Error("Cannot discard the application modules cache.");
    }
  
    // Remove top scope from the stack.
    F.hierarchy_scopes_.pop();

    // Retrieve the global variables cache.
    var globals = F.get_hierarchy_cache(F.globals_cache_key_);

    // Restore global variables.
    for(var name in globals) {
      F.unset_global(name);
    }
    
    // Cleanup each removed module if able.
    for (var name in F.dynamic_cache_) {
      var module = F.dynamic_cache_[name];

      if(module && typeof module.__cleanup__ === 'function') {
        module.__cleanup__()
      }
    }

    //  Update copy of the latest hierarchy scope.
    F.dynamic_cache_ = F.hierarchy_scopes_[F.hierarchy_scopes_.length - 1];

    // Increment global time counter.
    F.global_time_++;    
  };


  /**
   * List modules that were invoked at least one time in the latest
   * hierarchy scope.
   *
   * @return {Array.<String>}
   */
  F.get_loaded_modules = function() {

    // Create an empty array for collecting the results.
    var arr = [];

    // Traverse through cache and push all modules into the array.
    for(var name in F.dynamic_cache_) {

      // Skip modules that are being currently processed.
      if(F.dynamic_cache_[name] !== -1) {
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
    if(F.reserved_ns_prefix_.test(name)) {
      throw new Error('Module name is required not to start with "?!".');
    }

    // Save module old API into a local variable.
    var old = F.dynamic_cache_[name];

    // Replace module with a new API.
    F.dynamic_cache_[name] = module;
    
    // Increment global time counter.
    F.global_time_++;

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
    if(!F.reserved_ns_prefix_.test(ns)) {
      throw new Error('Namespace is required to start with "?!".');
    }

    // Create cache if it doesn't exist.
    if(!(ns in F.dynamic_cache_)) {
      F.dynamic_cache_[ns] = {};
    }

    return F.dynamic_cache_[ns];
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
  var F_ = window.F;


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
      window.F = F_;
    }

    // Return fierry.js F reference to a client.
    return F;
  };


  // Key for retrieving global variables cache.
  F.globals_cache_key_ = '?!globals';

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
    var globals = F.get_hierarchy_cache(F.globals_cache_key_);

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
    var globals = F.get_hierarchy_cache(F.globals_cache_key_);
    
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
  F.global_cache_ = {};


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
    if(!(ns in F.global_cache_)) {
      F.global_cache_[ns] = {};
    }
    return F.global_cache_[ns];
  };



  /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
   *
   * Object identification mechanism. Enables client to stamp objects
   * witemh unique ID.
   *
   * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */



  // Global uid sequence. Starts with 1 as 0 evaluates to false when
  // forced to act as a Boolean.
  F.uid_sequence_ = 1;


  /**
   * Stamps an object with an unique int identificator.
   *
   * @param o  {Object}
   */
  F.uid = function(o) {

    // Throw an error, the argument is not an object.
    if(!(o instanceof Object)) {
      throw new Error("Can't retrieve UID from a primitive.");
    }

    // Assign a unique identifier to the given object.
    // Increment the global uid sequence.
    if(!o.__uid__) {
      o.__uid__ = F.uid_sequence_++;
    }
    return o.__uid__;
  };



  /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
   *
   * Single inheritance mechanism.
   *
   * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */



  /**
   * Attaches parent class to its subclass via prototypal inheritance.
   * Please note that this function does not preserve the existing
   * prototype of the subclass and should be run immediatelly after
   * the constructor function definition.
   *
   * @param cls     {Function}
   * @param parent  {Function}
   */
  F.extend = function(cls, parent) {
    var ctor = function() {}
    ctor.prototype = parent.prototype;

    cls.prototype = new ctor();
    return cls;
  };



  /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
   *
   * Object tagging mechanism. Enables client to attach any number 
   * of labels to any kind of object (e.g: hash, function, array) 
   * via tag() method, and to distinguish objects by their labels 
   * using is() method.
   *
   * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */



  /**
   * Tags the given object with any number of labels. This function
   * accepts variable argument list where all arguments are {String}
   * labels except last {Object} object to tag. It returns the 
   * provided tagged object.
   *
   * @param label   {String...}
   * @param object  {Object}
   * @return        {Object}
   */
  F.tag = function() {
    var last   = arguments.length - 1,
        object = arguments[last];

    // Set labels directly when object was not tagged yet.
    if(!object.__tag__) {
      
      // Optimization when there is only one label to tag.
      if(last === 1) {
        object.__tag__ = [arguments[0]];

      // TODO slice or concat would be faster? Or mayby direct push??
      } else {
        object.__tag__ = Array.prototype.slice.call(arguments, 0, last);
      }

    // Push additional labels into the object's tag property.
    } else {
      for(var i = 0, l = arguments.length - 1; i < l; i++) {
        object.__tag__.push(arguments[i]);
      }
    }

    // Return the given object to the client.
    return object;
  };


  /**
   * Returns true if the object contains the given label as its tag.
   *
   * @param label   {String}
   * @param object  {Object}
   * @return        {Boolean}
   */
  F.is = function(label, object) {
    return object.__tag__ ? object.__tag__.indexOf(label) !== -1 : false;
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
    return typeof o === 'boolean' || o instanceof Boolean
  };


  /**
   * Returns true if argument is a number.
   *
   * @param o  {*}
   * @return   {Boolean} 
   */
  F.is_number = function(o) {
    return typeof o === 'number' || o instanceof Number
  };


  /**
   * Returns true if argument is a string.
   *
   * @param o  {*}
   * @return   {Boolean}
   */
  F.is_string = function(o) {
    return typeof o === 'string' || o instanceof String
  };


  /**
   * Returns true if argument is a function.
   *
   * @param o  {*}
   * @return   {Boolean}
   */
  F.is_function = function(o) {
    return typeof o === 'function' || o instanceof Function
  };


  /**
   * Returns true if argument is an array.
   *
   * @param o  {*}
   * @return   {Boolean}
   */
  F.is_array = function(o) {
    return o instanceof Array
  };



  /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
   *
   * Utilities. Whatever.
   *
   * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */



  /**
   * Returns randomly generated number. If the max argument is given,
   * returns an integer from <0, max-1> with uniform distribution.
   * Otherwise it behaves exactly as Math.random() returning float
   * from <0, 1>.
   *
   * @param max  {Number}  positive integer.
   * @return     {Number}
   */
  F.random = function(max) {
    return max ? ~~(Math.random() * max) : Math.random();
  };


  F.ops_per_ms = function() {
    var sum = 0
    for(var i = 0, l = arguments.length; i < l; i++) {
      sum += 1 / (arguments[i] * 1000)
    }
    return 1 / sum / 1000
  };


  return F;

})();



/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *
 * Extending RegExp object.
 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */



/**
 * Quotes the given string. Escapes all special characters with proper
 * backslashes for string to match literally the given string. 
 *
 * @param str  {String}
 * @return     {String}
 */
RegExp.quote = function(str) {
  return str.replace(/([.?*+^$[\]\\(){}-])/g, '\\$1');
};



/**
 * A convinience layer for executing the requestAnimationFrame() in
 * different browsers.
 */
window.requestAnimationFrame = (function(){
  return  window.requestAnimationFrame       || 
          window.webkitRequestAnimationFrame || 
          window.mozRequestAnimationFrame    || 
          window.oRequestAnimationFrame      || 
          window.msRequestAnimationFrame     || 
          function(callback) {
            return window.setTimeout(callback, 1000 / 60);
          };
})();


/**
 * A convinience layer for executing the cancelAnimationFrame() in
 * different browsers.
 */
window.cancelAnimationFrame = (function(){
  return  window.cancelAnimationFrame       || 
          window.webkitCancelAnimationFrame || 
          window.mozCancelAnimationFrame    || 
          window.oCancelAnimationFrame      || 
          window.msCancelAnimationFrame     || 
          function(id) {
            window.clearTimeout(id);
          };
})();
