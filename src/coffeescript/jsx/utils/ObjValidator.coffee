###
* check if an object is in below structure
* {
*   property: non-empty array 
* }
###

_isArray = require "lodash/lang/isArray"

module.exports = (obj) ->

  for key, value of obj
    if key and _isArray(value) and value.length
      return true
    else
      return false