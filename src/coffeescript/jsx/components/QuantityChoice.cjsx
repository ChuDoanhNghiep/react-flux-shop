React = require "react"

QuantityChoice = React.createClass

  getInitialState: ->
    quantity: 1

  handleMinus: ->
    if @state.quantity > 0
      @setState
        quantity: @state.quantity - 1

  handlePlus: ->
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