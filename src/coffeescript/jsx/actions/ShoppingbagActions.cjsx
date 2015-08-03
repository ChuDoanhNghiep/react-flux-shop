AppDispatcher = require "../dispatcher/AppDispatcher.cjsx"
ShopConstants = require "../constants/ShopConstants.cjsx"

ShoppingbagActions = 

  increaseShoppingbagProductQuantity: (data) ->
    AppDispatcher.handleViewAction
      actionType: ShopConstants.INCREASE_SHOPPINGBAG_PRODUCT_QUANTITY
      data: data

  decreaseShoppingbagProductQuantity: (data) ->
    AppDispatcher.handleViewAction
      actionType: ShopConstants.DECREASE_SHOPPINGBAG_PRODUCT_QUANTITY
      data: data

  removeShoppingbagProduct: (data) ->
    AppDispatcher.handleViewAction
      actionType: ShopConstants.REMOVE_SHOPPINGBAG_PRODUCT
      data: data


module.exports = ShoppingbagActions