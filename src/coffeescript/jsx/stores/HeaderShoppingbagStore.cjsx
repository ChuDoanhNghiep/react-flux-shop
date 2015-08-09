AppDispatcher = require "../dispatcher/AppDispatcher.cjsx"
EventEmitter = require("events").EventEmitter
ShopConstants = require "../constants/ShopConstants.cjsx"
assign = require "react/lib/Object.assign"
ShoppingbagAPI = require "../utils/ShoppingbagAPI.coffee"

productCount = ShoppingbagAPI.getProductCount()

addProduct = (data) ->
  productCount = productCount + data

removeProduct = (num) ->
  productCount -= num

addOne = ->
  productCount += 1

minusOne = ->
  productCount -= 1

HeaderShoppingbagStore = assign {}, EventEmitter.prototype,
  getProductCount: ->
    productCount

  emitChange: ->
    @emit "change"

  addChangeListener: (callback) ->
    @on "change", callback

  removeChangeListener: (callback) ->
    @removeListener "change", callback

AppDispatcher.register (payload) ->
  action = payload.action

  switch action.actionType

    when ShopConstants.ADD_TO_SHOPPINGBAG
      addProduct(action.data)

    when ShopConstants.REMOVE_SHOPPINGBAG_PRODUCT
      removeProduct(action.data.quantity)

    when ShopConstants.DECREASE_SHOPPINGBAG_PRODUCT_QUANTITY
      minusOne()

    when ShopConstants.INCREASE_SHOPPINGBAG_PRODUCT_QUANTITY
      addOne()

    else
      return true

  HeaderShoppingbagStore.emitChange()

  return true

module.exports = HeaderShoppingbagStore