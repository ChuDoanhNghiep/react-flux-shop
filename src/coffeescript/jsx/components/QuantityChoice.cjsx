React = require "react"

QuantityChoice = React.createClass

  getDefaultProps: ->
    quantity: 1

  render: ->
    return  <div className="quantity">
              <span className="label">Quantity</span>
              <span className="qt-choice minus" onClick={this.props.minusClick}>-</span>
              <span className="qt-choice qt-value"> {this.props.quantity}</span>
              <span className="qt-choice plus" onClick={this.props.plusClick}>+</span>
            </div>

module.exports = QuantityChoice