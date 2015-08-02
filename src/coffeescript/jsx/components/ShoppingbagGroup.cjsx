React = require "react"
ShoppingbagProduct = require "./ShoppingbagProduct.cjsx"

ShoppingbagGroup = React.createClass

  getInitialState: ->
    category: @props.category
    products: @props.products

  render: ->
    items = @state.products.map (product) =>
      return <ShoppingbagProduct key={product.objectID} product={product} />

    return <div className="ShoppingBagGroup">
              <div className="ShoppingBagHeader allowance under-allowance ">
                <div className="img">
                  <img style={{width:"52px",height:"52px"}} src="./images/icons/allowance-Wines-x2.png" />
                </div>
                <div className="desc">
                  <span className="title">{this.state.category}  </span><span className="total">1.25cL Allowance</span>
                  <div className="link">
                    <a className="link">Buy {this.state.category} now</a>
                  </div>
                </div>
              </div>
              {items}
            </div>

module.exports = ShoppingbagGroup