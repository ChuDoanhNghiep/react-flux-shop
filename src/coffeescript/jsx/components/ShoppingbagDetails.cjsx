React = require "react"
ShoppingbagEmpty = require "./ShoppingbagEmpty.cjsx"
ShoppingbagHeader = require "./ShoppingbagHeader.cjsx"
ShoppingbagFooter = require "./ShoppingbagFooter.cjsx"
ShoppingbagGroup = require "./ShoppingbagGroup.cjsx"

ShoppingbagStore = require "../stores/ShoppingbagStore.cjsx"

calculateTotalPrice = (data) ->
  if data is null
    return 0
  total = 0
  for item in data
    total += (item.price * item.quantity)
  return total

calculateSize = (data) ->
  if data is null
    return 0
  size = 0
  for item in data
    size += (item.size * item.quantity)
  return size

calculateLabel = (wine, beer, spirit) ->
  wineSize = calculateSize(wine)
  beerSize = calculateSize(beer)
  spiritSize = calculateSize(spirit)
  # console.log wineSize,beerSize,spiritSize

  if spirit.length
    if wineSize > 1 or beerSize > 1 or spiritSize > 1
      return {type: 1, over: true}
    else 
      return {type: 1, over: false}

  if wine.length
    if wineSize <= 1 and beerSize <= 1
      return {type: 1, over: false}
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

getCurrentState = ->
  addedProducts = ShoppingbagStore.getShoppingbagProducts()
  total = calculateTotalPrice addedProducts
  return {addedProducts: addedProducts, total: total}

ShoppingbagDetails = React.createClass

  getInitialState: ->
    getCurrentState()

  componentDidMount: ->
    ShoppingbagStore.addChangeListener @handleChange

  componentWillUnmount: ->
    ShoppingbagStore.removeChangeListener @handleChange

  handleChange: ->
    @setState getCurrentState()

  render: ->
    if @state.addedProducts and @state.addedProducts.length

      wine = @state.addedProducts.filter (product) ->
        product.category.toLowerCase() is "wine"
      beer = @state.addedProducts.filter (product) ->
        product.category.toLowerCase() is "beer"
      spirit = @state.addedProducts.filter (product) ->
        product.category.toLowerCase() is "spirit"

      label = calculateLabel wine, beer, spirit

      wineQuota = 1
      beerQuota = 1
      spiritQuota = 1
      if label.type is 2
        wineQuota = 2
        spiritQuota = 0
      else if label.type is 3
        beerQuota = 2
        spiritQuota = 0 

      return <div className="shoppingBag-page">
                <section className="ShoppingBag ShoppingBagPage">
                  <ShoppingbagHeader label={label} />
                  <div className="ShoppingBag groupWrap">
                    <ShoppingbagGroup category="wine" products={wine} quota={wineQuota} />
                    <ShoppingbagGroup category="spirit" products={spirit} quota={spiritQuota} />
                    <ShoppingbagGroup category="beer" products={beer} quota={beerQuota} />
                  </div>
                  <ShoppingbagFooter total={this.state.total} />
                </section>
              </div>
    else
      return <div className="shoppingBag-page"> 
                <ShoppingbagEmpty />           
              </div>      

module.exports = ShoppingbagDetails