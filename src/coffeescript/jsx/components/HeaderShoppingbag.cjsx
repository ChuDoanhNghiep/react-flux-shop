React = require "react"

HeaderShoppingbagStore = require "../stores/HeaderShoppingbagStore.cjsx"

getProductCount = ->
  productCount: HeaderShoppingbagStore.getProductCount()

HeaderShoppingbag = React.createClass
  
  getInitialState: ->
    getProductCount()

  componentDidMount: ->
    HeaderShoppingbagStore.addChangeListener @handleChange

  componentWillUnmount: ->
    HeaderShoppingbagStore.removeChangeListener @handleChange

  handleChange: ->
    @setState getProductCount()

  render: ->
    num = if @state.productCount > 0 then <span className="nb-products">{@state.productCount}</span> else ""


    return  <div className="title img">
            <a href="#/shoppingbag">
              <svg className="icon-svg icon-cart" dangerouslySetInnerHTML={{__html:'<use xlink:href="#icon-cart"></use>'}}>
              </svg>
            </a>
              {num}
            </div>

module.exports = HeaderShoppingbag