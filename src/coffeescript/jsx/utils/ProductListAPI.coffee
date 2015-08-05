_sortByOrder = require "lodash/collection/sortByOrder"
_find = require "lodash/collection/find"
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

  getProductByCategory: (category, type) ->
    data = @getAllProduct()

    if category and type
      _find data, (p) ->
        p.category is category and p.type is type
        
    else if category
      _find data, (p) ->      
        p.category is category

  updateProductInventory: (id, num) ->
    data = @getAllProduct()
    idx = _findIndex data, (p) ->
      p.id is id
    data[idx].inventory = num
    
    localStorage.setItem "products", JSON.stringify(data) 
