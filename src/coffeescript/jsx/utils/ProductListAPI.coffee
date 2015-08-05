_sortByOrder = require "lodash/collection/sortByOrder"
_find = require "lodash/collection/find"
_filter = require "lodash/collection/filter"
_findIndex = require "lodash/array/findIndex"
validator = require "./ObjValidator.coffee"

sort = (data, sorter) ->
  switch sorter

    when "shop_recommended"
      data.filter (elem, index, array) ->
        elem[sorter]

    when "price_ascending"
      _sortByOrder data, ["price"], ["asc"]

    when "price_descending"
      _sortByOrder data, ["price"], ["desc"]

    when "A_to_Z"
      _sortByOrder data, ["name"], ["asc"]

    when "Z_to_A"
      _sortByOrder data, ["name"], ["desc"]

    else
      data    

refine = (data, refiners) ->
  refinedData = []

  for categoryID in Object.keys(refiners)

    if refiners[categoryID].length

      for refiner in refiners[categoryID]
        refiner = refiner.toLowerCase()

        # console.log refiner
        tmp = data.filter (elem) ->
          elem[categoryID].toLowerCase() is refiner

        # console.log tmp
        refinedData = refinedData.concat tmp
        # console.log refinedData
  return refinedData

module.exports =

  getAllProduct: ->
    return JSON.parse localStorage.getItem("products")

  getProductListData: (sorter, refiners)->
    data = @getAllProduct()

    if refiners and validator(refiners)
      refinedData = refine data, refiners

      return sort(refinedData, sorter)

    else
      return sort(data, sorter)

  getfilteredData: (data, sorter, refiners) ->
    
    if refiners and validator(refiners)
      refinedData = refine data, refiners

      return sort(refinedData, sorter)

    else
      return sort(data, sorter)

  getProductByID: (id) ->
    data = @getAllProduct()
    
    _find data, (p) ->
      p.id is id

  getProductByCategory: (categoryVal, typeVal) ->
    data = @getAllProduct()

    if categoryVal and typeVal
       return _filter data, {"category": categoryVal.toLowerCase(), "type": typeVal.toLowerCase()}
        
    else if categoryVal
      return _filter data, {"category": categoryVal.toLowerCase()}

    return []

  updateProductInventory: (id, num) ->
    data = @getAllProduct()
    idx = _findIndex data, (p) ->
      p.id is id
    data[idx].inventory = num
    
    localStorage.setItem "products", JSON.stringify(data) 
