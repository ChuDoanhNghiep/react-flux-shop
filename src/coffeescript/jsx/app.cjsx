window.React = require "react"
ProductListData = require "./ProductListData.coffee"
main = require "./components/Main.cjsx"
brandCollection = require "./components/BrandCollection.cjsx"
productDetails = require "./components/ProductDetails.cjsx"

ReactRouter = require "react-router"
Route = ReactRouter.Route

ProductListData.init()

routes =
  <Route handler={main}>
    <Route name="brandCollection" path="/" handler={brandCollection} />
    <Route name="productDetails" path="/product/:id" handler={productDetails} />
  </Route>


ReactRouter.run routes, ReactRouter.HashLocation, (Root) ->
  React.render <Root/>, document.getElementById "app-container"

