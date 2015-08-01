AppDispatcher = require "../dispatcher/AppDispatcher.cjsx"
EventEmitter = require("events").EventEmitter
ShopConstants = require "../constants/ShopConstants.cjsx"
assign = require "react/lib/Object.assign"

selectedQuantity = 0

updateQuantity = (n) ->
  selectedQuantity = n

ProductDetailsStore = assign {}, EventEmitter.prototype,
  getSeletedQuantity: ->
    selectedQuantity

  emitChange: ->
    @emit "change"

  addChangeListener: (callback) ->
    @on "change", callback

  removeChangeListener: (callback) ->
    @removeListener "change", callback

AppDispatcher.register (payload) ->
  action = payload.action
  # console.log action

  switch action.actionType

    when ShopConstants.SELECT_QUANTITY
      updateQuantity(action.data)

    else
      return true

  ProductDetailsStore.emitChange()

  return true

module.exports = ProductDetailsStore