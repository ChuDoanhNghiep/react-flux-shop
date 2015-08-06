AppDispatcher = require "../dispatcher/AppDispatcher.cjsx"
EventEmitter = require("events").EventEmitter
ShopConstants = require "../constants/ShopConstants.cjsx"
assign = require "react/lib/Object.assign"

ProductListAPI = require "../utils/ProductListAPI.coffee"
ProductRefinerExtractor = require "../utils/ProductRefinerExtractor.coffee"

selectedSorter = "shop_recommended"
selectedRefiners = {}
productList = []
productRefiners = {}

setProductListSorter = (Sorter) ->
  selectedSorter = Sorter

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

setProductList = (category, subCategory) ->
    if category
      productList = ProductListAPI.getProductByCategory category, subCategory
    else
      productList = ProductListAPI.getAllProduct()

    if selectedSorter
      productList = ProductListAPI.getfilteredData productList, selectedSorter

sortProductList = ->
  productList = ProductListAPI.getfilteredData productList, selectedSorter

setProductRefiners = (category) ->
  console.log "set refiners"
  productRefiners = ProductRefinerExtractor productList, category

ProductListStore = assign {}, EventEmitter.prototype,
  getSeletedProductSorter: ->
    selectedSorter

  getSeletedProductRefiners: ->
    selectedRefiners

  getProductList: ->
    productList

  getProductRefiners: ->
    productRefiners

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

    when ShopConstants.SET_SORTER
      setProductListSorter action.data
      sortProductList()

    when ShopConstants.ADD_REFINER
      addProductRefiner action.data

    when ShopConstants.REMOVE_REFINER
      removeProductRefiner action.data

    when ShopConstants.CLEAR_REFINER
      removeAllProductRefiner action.data

    when ShopConstants.TRANSITION
      setProductList action.data.category, action.data.subCategory
      setProductRefiners action.data.category
      
      ProductListStore.emitChange()

    else
      return true

  ProductListStore.emitChange()

  return true

module.exports = ProductListStore