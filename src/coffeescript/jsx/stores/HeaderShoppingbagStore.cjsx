AppDispatcher = require "../dispatcher/AppDispatcher.cjsx"
EventEmitter = require("events").EventEmitter
ShopConstants = require "../constants/ShopConstants.cjsx"
assign = require "react/lib/Object.assign"

productCount = 0

addProduct = (data) ->
  productCount = productCount + data

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

    else
      return true

  HeaderShoppingbagStore.emitChange()

  return true

module.exports = HeaderShoppingbagStore