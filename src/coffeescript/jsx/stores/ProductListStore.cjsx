AppDispatcher = require "../dispatcher/AppDispatcher.cjsx"
EventEmitter = require("events").EventEmitter
ShopConstants = require "../constants/ShopConstants.cjsx"
assign = require "react/lib/Object.assign"

selectedFilter = ""
selectedRefiners = {}

setProductListFilter = (filter) ->
  selectedFilter = filter

addProductRefiner = (refiner) ->
  categoryArray = selectedRefiners[refiner.categoryID]
  if categoryArray and categoryArray.length
    categoryArray.push refiner.itemLabel
  else
    selectedRefiners[refiner.categoryID] = [].concat refiner.itemLabel

removeProductRefiner = (refiner) ->
  categoryArray = selectedRefiners[refiner.categoryID]

  idx = categoryArray.indexOf refiner.itemLabel
  console.log idx
  if idx > -1
    categoryArray.splice idx, 1

removeAllProductRefiner = (data) ->
  selectedRefiners = {}

ProductListStore = assign {}, EventEmitter.prototype,
  getSeletedProductFilter: ->
    selectedFilter

  getSeletedProductRefiners: ->
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

    when ShopConstants.SET_FILTER
      setProductListFilter action.data

    when ShopConstants.ADD_REFINER
      addProductRefiner action.data

    when ShopConstants.REMOVE_REFINER
      removeProductRefiner action.data

    when  ShopConstants.CLEAR_REFINER
      removeAllProductRefiner action.data

    else
      return true

  ProductListStore.emitChange()

  return true

module.exports = ProductListStore