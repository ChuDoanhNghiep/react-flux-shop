React = require "react"
ProductListAPI = require "../utils/ProductListAPI.coffee"

ProductDetails = React.createClass

  getInitialState: ->
    product: ProductListAPI.getProductByID @props.params.id

  componentDidMount: ->
    id = @props.params.id
    @setState {product: ProductListAPI.getProductByID(id)}

  render: ->
    return <div>
            {this.state.product.id}
           </div>

module.exports = ProductDetails