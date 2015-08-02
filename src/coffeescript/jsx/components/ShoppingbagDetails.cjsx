React = require "react"
ShoppingbagEmpty = require "./ShoppingbagEmpty.cjsx"
ShoppingbagHeader = require "./ShoppingbagHeader.cjsx"
ShoppingbagFooter = require "./ShoppingbagFooter.cjsx"
ShoppingbagGroup = require "./ShoppingbagGroup.cjsx"
ShoppingbagAPI = require "../utils/ShoppingbagAPI.coffee"

ShoppingbagDetails = React.createClass

  getInitialState: ->
    addedProducts: ShoppingbagAPI.getShoppingbagProducts()

  render: ->
    if @state.addedProducts

      wine = @state.addedProducts.filter (product) ->
        product.category.toLowerCase() is "wine"
      beer = @state.addedProducts.filter (product) ->
        product.category.toLowerCase() is "beer"
      spirit = @state.addedProducts.filter (product) ->
        product.category.toLowerCase() is "spirit"

      wineGroup = if wine.length then <ShoppingbagGroup category="wine" products={wine} /> else ""
      beerGroup = if beer.length then <ShoppingbagGroup category="beer" products={beer} /> else ""
      spiritGroup = if spirit.length then <ShoppingbagGroup category="spirit" products={spirt} /> else ""

      return <div className="shoppingBag-page">
                <section className="ShoppingBag ShoppingBagPage">
                  <ShoppingbagHeader addedProducts={this.state.addedProducts} />
                  <div className="ShoppingBag groupWrap">
                    {wineGroup}
                    {spiritGroup}
                    {beerGroup}
                  </div>
                  <ShoppingbagFooter />
                </section>
              </div>
    else
      return <div className="shoppingBag-page"> 
                <ShoppingbagEmpty />           
              </div>      

module.exports = ShoppingbagDetails