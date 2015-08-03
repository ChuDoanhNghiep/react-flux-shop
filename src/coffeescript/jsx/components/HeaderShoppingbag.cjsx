React = require "react"

HeaderShoppingbagStore = require "../stores/HeaderShoppingbagStore.cjsx"
# ShoppingbagStore = require "../stores/ShoppingbagStore.cjsx"

getProductCount = ->
  productCount: HeaderShoppingbagStore.getProductCount()

# getProductCountFromShoppingbag = ->

HeaderShoppingbag = React.createClass
  
  getInitialState: ->
    productCount: 0

  componentDidMount: ->
    HeaderShoppingbagStore.addChangeListener @handleChange
    # ShoppingbagStore.addChangeListener @handleShoppingbagChange

  componentWillUnmount: ->
    HeaderShoppingbagStore.removeChangeListener @handleChange
    # ShoppingbagStore.removeChangeListener @handleShoppingbagChange

  handleChange: ->
    @setState getProductCount()

  # handleShoppingbagChange: ->



  render: ->
    num = if @state.productCount > 0 then <span className="nb-products">{@state.productCount}</span> else ""


    return  <div className="title img">
            <a href="#/shoppingbag"><i className="icon icon-shoppingbag-white-base64"></i></a>
              {num}
            </div>

module.exports = HeaderShoppingbag