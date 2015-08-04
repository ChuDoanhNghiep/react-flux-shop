React = require "react"

ShoppingbagFooter = React.createClass

    render: ->

        return <div className="ShoppingBagFooter">
                  <div className="promo">
                    <div className="title">PROMOTIONS:</div>
                    <div className="price ShoppingBagPriceWrap">
                        <span className="currency">
                        <span className="symbol-before">›</span>
                        <span className="underline">S$</span>
                        <span className="amount">xxx</span>
                        </span>
                    </div>
                  </div>
                  <div className="total-confirmation">
                    <div className="price ShoppingBagPriceWrap ShoppingBagPriceTotalWrap">
                        <span className="currency">
                            <span className="symbol-before">›</span>
                            <span className="underline">S$</span>
                            <span className="amount">{this.props.total}</span>
                        </span>
                    </div>
                    <div className="title">total</div>
                  </div>
                </div>

module.exports= ShoppingbagFooter