AppDispatcher = require "../dispatcher/AppDispatcher.cjsx"
ShopConstants = require "../constants/ShopConstants.cjsx"

ProductFilterActions = 

  addProductRefiner: (data) ->
    AppDispatcher.handleViewAction
      actionType: ShopConstants.ADD_REFINER
      data: data

  removeProductRefiner: (data) ->
    AppDispatcher.handleViewAction
      actionType: ShopConstants.REMOVE_REFINER
      data: data

  clearProductRefiner: (data) ->
    AppDispatcher.handleViewAction
      actionType: ShopConstants.CLEAR_REFINER
      data: data
     
  setProductListFilter: (data) ->
    AppDispatcher.handleViewAction
      actionType: ShopConstants.SET_FILTER
      data: data

module.exports = ProductFilterActions