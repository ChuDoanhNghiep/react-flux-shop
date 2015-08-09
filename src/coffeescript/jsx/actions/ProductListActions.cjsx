AppDispatcher = require "../dispatcher/AppDispatcher.cjsx"
ShopConstants = require "../constants/ShopConstants.cjsx"

ProductListActions = 

  transition: (data) ->
    AppDispatcher.handleViewAction
      actionType: ShopConstants.TRANSITION
      data: data

module.exports = ProductListActions