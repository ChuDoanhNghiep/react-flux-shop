###
* find available refiners from list of products, based on category
###
_indexOf = require "lodash/array/indexOf"

extractor = (data, props) ->
  #init results object
  results = {}
  for prop in props 
    results[prop] = []

  for item in data
    for prop in props
      if item[prop] and _indexOf(results[prop], item[prop]) is -1
        results[prop].push item[prop]

  return results

module.exports = (data, category) ->

  if not category
    return false

  listObj = switch category.toLowerCase()

    when "wine"
      props = ["brand", "type", "country", "grape_varietal", "region"]
      extractor(data, props) 

    when "spirit"
      props = ["brand", "type"]
      extractor(data, props)

    when "beer"
      props = ["brand"]
      extractor(data, props)

  return listObj    
