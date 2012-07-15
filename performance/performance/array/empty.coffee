# Checking if array is empty
performance '/array.empty'

  before:   -> @arr = []

  'length': -> @arr.length is 0

  'cast':   -> @arr is ''
