React = require "react"
ProductDetailsActions = require "../actions/ProductDetailsActions.cjsx"

QuantityChoice = React.createClass

  getInitialState: ->
    quantity: 1

  handleMinus: ->
    if @state.quantity > 1
      ProductDetailsActions.selectQuantity @state.quantity - 1

      @setState
        quantity: @state.quantity - 1

  handlePlus: ->
    ProductDetailsActions.selectQuantity @state.quantity + 1
    @setState
      quantity: @state.quantity + 1

  render: ->
    return  <div className="quantity">
              <span className="label">Quantity</span>
              <span className="qt-choice minus" onClick={this.handleMinus}>-</span>
              <span className="qt-choice qt-value"> {this.state.quantity}</span>
              <span className="qt-choice plus" onClick={this.handlePlus}>+</span>
            </div>

module.exports = QuantityChoice