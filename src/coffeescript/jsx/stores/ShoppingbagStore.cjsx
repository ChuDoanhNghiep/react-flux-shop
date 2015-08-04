AppDispatcher = require "../dispatcher/AppDispatcher.cjsx"
EventEmitter = require("events").EventEmitter
ShopConstants = require "../constants/ShopConstants.cjsx"
assign = require "react/lib/Object.assign"
ShoppingbagAPI = require "../utils/ShoppingbagAPI.coffee"

updateItem = (item) ->
  ShoppingbagAPI.updateShoppingbagProductQuantity item

updateItem2 = (item) ->
  ShoppingbagAPI.updateShoppingbagProductQuantity item

removeItem = (item) ->
  ShoppingbagAPI.removeShoppingbagProduct item

ShoppingbagStore = assign {}, EventEmitter.prototype,

  getShoppingbagProducts: ->
    ShoppingbagAPI.getShoppingbagProducts()

  emitChange: ->
    @emit "change"

  addChangeListener: (callback) ->
    @on "change", callback

  removeChangeListener: (callback) ->
    @removeListener "change", callback

AppDispatcher.register (payload) ->
  action = payload.action

  switch action.actionType

    when ShopConstants.REMOVE_SHOPPINGBAG_PRODUCT
      removeItem(action.data)

    when ShopConstants.INCREASE_SHOPPINGBAG_PRODUCT_QUANTITY
      updateItem(action.data)

    when ShopConstants.DECREASE_SHOPPINGBAG_PRODUCT_QUANTITY
      updateItem2(action.data)

    else
      return true

  ShoppingbagStore.emitChange()

  return true

module.exports = ShoppingbagStore