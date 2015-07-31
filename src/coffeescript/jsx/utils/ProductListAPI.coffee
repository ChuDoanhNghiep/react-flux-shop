_sortByOrder = require "lodash/collection/sortByOrder"
_find = require "lodash/collection/find"
validator = require "./ObjValidator.coffee"

sort = (data, filter) ->
  switch filter

    when "shop_recommended"
      data.filter (elem, index, array) ->
        elem[filter]

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

module.exports =

  getAllProduct: ->
    return JSON.parse localStorage.getItem("products")

  getProductListData: (filter, refiners)->
    data = @getAllProduct()

    if refiners and validator(refiners)
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

      return sort(refinedData, filter)

    else
      return sort(data, filter)

  getProductByID: (id) ->
    data = @getAllProduct()
    
    _find data, (p) ->
      p.id is id