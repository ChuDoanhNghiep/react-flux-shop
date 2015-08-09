AppDispatcher = require "../dispatcher/AppDispatcher.cjsx"
EventEmitter = require("events").EventEmitter
ShopConstants = require "../constants/ShopConstants.cjsx"
assign = require "react/lib/Object.assign"

selectedRefiners = {}

addRefiner = (item) ->
  selectedRefiners[item.itemID] = item
  console.log selectedRefiners

removeRefiner = (item) ->
  delete selectedRefiners[item.itemID]

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
      addRefiner action.data

    when ShopConstants.REMOVE_REFINER
      removeRefiner action.data

    when ShopConstants.CLEAR_REFINER
      removeAllRefiner(action.data)

    when ShopConstants.TRANSITION
      removeAllRefiner(action.data)

    else
      return true

  ProductFilterStore.emitChange()

  return true

module.exports = ProductFilterStore