_findIndex = require "lodash/array/findIndex"

module.exports =

  getShoppingbagProducts: ->
    return JSON.parse localStorage.getItem("shoppingbagProducts")

  # add new product or increase existing product quantity
  addShoppingbagProduct: (data) ->
    all = @getShoppingbagProducts()
    idx = -1
    if all
      idx = _findIndex all, (p) ->
        p.id is data.id
    else
      all = []

    if idx >= 0
      all[idx].quantity += data.quantity
    else
      all.push data

    localStorage.setItem "shoppingbagProducts", JSON.stringify(all)

  # remove existing product
  removeShoppingbagProduct: (data) ->
    all = @getShoppingbagProducts()
    idx = _findIndex all, (p) ->
      p.id is data.id
    all.splice idx, 1

    localStorage.setItem "shoppingbagProducts", JSON.stringify(all)

  # update existing product quantity, note you can't use this func to remove product!!
  updateShoppingbagProductQuantity: (data) ->
    all = @getShoppingbagProducts()
    idx = _findIndex all, (p) ->
      p.id is data.id

    all[idx].quantity = data.quantity

    localStorage.setItem "shoppingbagProducts", JSON.stringify(all)    
