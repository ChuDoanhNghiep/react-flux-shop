AppDispatcher = require "../dispatcher/AppDispatcher.cjsx"
EventEmitter = require("events").EventEmitter
ShopConstants = require "../constants/ShopConstants.cjsx"
assign = require "react/lib/Object.assign"

selectedRefiners = {}

addRefiner = (itemID, itemLabel) ->
  selectedRefiners[itemID] = itemLabel
  console.log selectedRefiners

removeRefiner = (itemID) ->
  delete selectedRefiners[itemID]

removeAllRefiner = (empty) ->
  for key of selectedRefiners
    removeRefiner key

ProductFilterStore = assign {}, EventEmitter.prototype,
  getSeletedRefiners: ->
    selectedRefiners

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

    when ShopConstants.ADD_REFINER
      addRefiner(action.data.itemID, action.data.itemLabel)

    when ShopConstants.REMOVE_REFINER
      removeRefiner(action.data.itemID)

    when ShopConstants.CLEAR_REFINER
      removeAllRefiner(action.data)

    else
      return true

  ProductFilterStore.emitChange()

  return true

module.exports = ProductFilterStore