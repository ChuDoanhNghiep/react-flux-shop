React = require "react"
TimeoutTransitionGroup = require "../helper/timeout-transition-group.js"
ShoppingbagProduct = require "./ShoppingbagProduct.cjsx"
classNames = require "classnames"

getTotalSize = (data) ->
  total = 0
  if data
    for item in data
      total += item.size * item.quantity
  return total

ShoppingbagGroup = React.createClass

  getInitialState: ->
    category: @props.category
    products: @props.products
    quota: @props.quota

  render: ->
    items = @props.products.map (product) =>
      return <ShoppingbagProduct key={product.id} product={product} />

    totalSize = getTotalSize @state.products

    label = classNames "ShoppingBagHeader allowance", {"under-allowance": totalSize and totalSize <= @state.quota, "over-allowance": totalSize and totalSize > @state.quota}

    imgUrl = "./images/icons/allowance-" + this.state.category + "-x2.png"

    return <div className="ShoppingBagGroup">
              <div className={label}>
                <div className="img">
                  <img style={{width:"52px",height:"52px"}} src={imgUrl} />
                </div>
                <div className="desc">
                  <span className="title">{this.state.category}  </span>
                  <span className="total">{this.state.quota}L Allowance</span>
                  <div className="link">
                    <a className="link">Buy {this.state.category} now</a>
                  </div>
                </div>
              </div>
              <TimeoutTransitionGroup transitionName="shoppingbagProduct" enterTimeout={10} leaveTimeout={300}>
              {items}
              </TimeoutTransitionGroup>

            </div>

module.exports = ShoppingbagGroup