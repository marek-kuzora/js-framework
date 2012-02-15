#
# Module providing commonly used regexp patterns.
#
return regexp =

  #
  # Represents selectable variable token.
  #
  VARIABLE: /^[a-zA-Z_][0-9a-zA-Z_]*$/

  UNSAFE: /([.?*+^$[\]\\(){}-])/g

  quote: (str) ->
    return str.replace(regexp.UNSAFE, '\\$1')
