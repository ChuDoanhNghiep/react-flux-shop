AppDispatcher = require "../dispatcher/AppDispatcher.cjsx"
ShopConstants = require "../constants/ShopConstants.cjsx"

ProductDetailsActions = 

  selectQuantity: (data) ->
    AppDispatcher.handleViewAction
      actionType: ShopConstants.SELECT_QUANTITY
      data: data

  addToShoppingbag: (data) ->
    AppDispatcher.handleViewAction
      actionType: ShopConstants.ADD_TO_SHOPPINGBAG
      data: data


module.exports = ProductDetailsActions