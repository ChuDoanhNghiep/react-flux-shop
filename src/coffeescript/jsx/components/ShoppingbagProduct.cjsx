React = require "react"

ShoppingbagProduct = React.createClass

  getInitialState: ->
    product: @props.product

  render: ->
      
    return   <ul className="ShoppingBagListProduct">
                <li className="ShoppingBagProduct">
                  <div className="ShoppingBagProductMenu">
                    <a href="#"><img src="./images/icons/delete-bag-item-x2.png"/></a>
                  </div>
                    <a className="img" href="#/product/{this.state.product.id}"><img src="http://placehold.it/86" /></a>
                  <div className="details">
                    <div className="kiwi-grid">
                      <div className="kiwi-col l-3-8 s-1">
                        <div className="detailsWrap">
                          <div className="name">{this.state.product.brand}</div>
                          <div className="desc">{this.state.product.name}</div>
                          <div className="reference">{this.state.product.sku}</div>
                        </div>
                      </div>
                      <div className="kiwi-col l-5-8 s-1">
                        <div className="size">SIZE: 75CL</div>
                        <div className="qt">QTY: 
                          <span className="minus disabled">-</span>
                          <span className="qt-value">{this.state.product.quantity}</span>
                          <span className="plus">+</span>
                        </div>
                        <div className="ShoppingBagPriceWrap">
                          <label>UNIT PRICE:</label>
                          <div className="priceWrap">
                            <span className="price beforePromo">
                              <span className="currency">S$</span><span className="amount">154555.77</span>
                            </span>
                            <div className="price promo">
                              <span className="curclassNamerency">
                                <span className="symbol-before">›</span><span className="underline">{this.state.product.currency}</span><span className="amount">{this.state.product.price}</span>
                              </span>
                            </div>
                          </div>
                        </div>
                        <div className="extra primary">
                          <div className="icon-pricetag icon-prependInline">
                          </div>FREE WEEKEND BAG WITH PURCHASE OF 1 BOTTLE MORE
                        </div>
                      </div>
                    </div>
                  </div>
                </li>
              </ul>


module.exports = ShoppingbagProduct