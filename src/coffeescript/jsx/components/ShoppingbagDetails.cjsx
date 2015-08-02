React = require "react"
ShoppingbagEmpty = require "./ShoppingbagEmpty.cjsx"
ShoppingbagHeader = require "./ShoppingbagHeader.cjsx"
ShoppingbagFooter = require "./ShoppingbagFooter.cjsx"
ShoppingbagGroup = require "./ShoppingbagGroup.cjsx"
ShoppingbagAPI = require "../utils/ShoppingbagAPI.coffee"

calculateSize = (data) ->
  size = 0
  for item in data
    size += (item.size * item.quantity)
  return size

calculateLabel = (wine, beer, spirit) ->
  wineSize = calculateSize(wine)
  beerSize = calculateSize(beer)
  spiritSize = calculateSize(spirit)
  console.log wineSize,beerSize,spiritSize

  if spirit.length
    if wineSize > 1 or beerSize > 1 or spiritSize > 1
      return {type: 1, over: true}
    else 
      return {type: 1, over: false}

  if wine.length
    if wineSize <= 2 and beerSize <= 1
      return {type: 2, over: false}
    if wineSize >2
      return {type: 2, over: true}
    if wineSize <= 1 and beerSize <= 2
      return {type: 3, over: false}
    if wineSize <= 1 and beerSize > 2
      return {type: 2, over: true}

  if beer.length
    if beerSize > 1 and beerSize <=2
      return {type: 3, over: false}
    if beerSize > 2
      return {type: 3, over:true}

  return {type: 1, over: false}


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

      label = calculateLabel wine, beer, spirit

      wineGroup = if wine.length then <ShoppingbagGroup category="wine" products={wine} /> else ""
      beerGroup = if beer.length then <ShoppingbagGroup category="beer" products={beer} /> else ""
      spiritGroup = if spirit.length then <ShoppingbagGroup category="spirit" products={spirt} /> else ""

      return <div className="shoppingBag-page">
                <section className="ShoppingBag ShoppingBagPage">
                  <ShoppingbagHeader label={label} />
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