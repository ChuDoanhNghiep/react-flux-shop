_findIndex = require "lodash/array/findIndex"

module.exports =

  getShoppingbagProducts: ->
    return JSON.parse localStorage.getItem("shoppingbagProducts")

  addShoppingbagProduct: (data) ->
    all = @getShoppingbagProducts()
    idx = -1
    if all
      idx = _findIndex all, (p) ->
        p.id is id
    else
      all = []

    if idx >= 0
      all[idx].quantity += data.quantity
    else
      all.push data

    localStorage.setItem "shoppingbagProducts", JSON.stringify(all)
