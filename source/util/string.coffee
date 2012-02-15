return string =

  # 
  # Returns a substring from the given string matching the following
  # criteria:
  #
  # If the cut-index is positive, returns substring that starts where
  # the given string starts and ends exactly where the token is
  # referenced n-th time counting from the beggining of the string.
  #
  # If the cut-index is negative, returns substring that ends where
  # the given string ends and starts exactly where the token is
  # referenced n-th time counting from the end of the string.
  #
  # In both cases the substring does not include the final token and
  # if there are less tokens than the given n, the method will return
  # the given string.
  #
  # Throws an error if n is equal 0.
  #
  # @param str    {String}
  # @param token  {String}
  # @param n      {Number}  cut-index
  #
  substridx: (str, token, n) ->

    # Assert cut-index is not zero
    if n is 0
      throw new Error 'Index cannot be 0.'

    # When cut-index is positive
    if n > 0

      # Find the substr end position.
      idx = 0
      idx = str.indexOf(token, idx) while n-- > 0 || idx is -1

      # Fix the substr end position if token wasn't found.
      idx = str.length if idx is -1

      return str.substr(0, idx)

    # When cut-index is negative
    else

      # Find the substr start position.
      idx = str.length
      idx = str.lastIndexOf(token, idx) while n++ < 0 || idx is -1

      # Fix the substr end position if token wasn't found.
      idx = 0 if idx is -1

      return str.substr(idx + 1)


  #
  # Returns new String padded with spaces to the left, matching
  # the specified length.
  #
  # @param str  {String}
  # @param len  {Number}
  #
  lpad: (str, len) ->
    str = ' ' + str while str.length < len
    return str

  #
  # Returns new String padded with spaces to the right, matching
  # the specified length.
  #
  # @param str  {String}
  # @param len  {Number}
  #
  rpad: (str, len) ->
    str += ' ' while str.length < len
    return str
