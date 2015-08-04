React = require "react"
QuantityChoice = require "./QuantityChoice.cjsx"
ShoppingbagActions = require "../actions/ShoppingbagActions.cjsx"

ShoppingbagProduct = React.createClass

  handleCloseClick: (event) ->
    event.preventDefault()
    removedProduct = @state.product
    ShoppingbagActions.removeShoppingbagProduct removedProduct

  handleQuantityMinus: ->
    if @state.selectedQuantity > 1
      updatedProduct = @state.product
      updatedProduct.quantity -= 1
      # console.log updatedProduct
      ShoppingbagActions.decreaseShoppingbagProductQuantity updatedProduct

      @setState
        selectedQuantity: @state.selectedQuantity - 1

  handleQuantityPlus: ->
    updatedProduct = @state.product
    updatedProduct.quantity += 1

    ShoppingbagActions.increaseShoppingbagProductQuantity updatedProduct    
    @setState
      selectedQuantity: @state.selectedQuantity + 1

  getInitialState: ->
    product: @props.product
    selectedQuantity: @props.product.quantity

  render: ->
    productUrl = "#/product/" + this.state.product.id

    return   <ul className="ShoppingBagListProduct">
                <li className="ShoppingBagProduct">
                  <div className="ShoppingBagProductMenu">
                    <a href="#" className="button close" onClick={this.handleCloseClick}></a>
                  </div>
                    <a className="img" href={productUrl}>
                      <img src="http://placehold.it/86" />
                    </a>
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
                        <div className="size">SIZE: {this.state.product.size * 100}CL</div>

                        <QuantityChoice quantity={this.state.selectedQuantity}
                          minusClick={this.handleQuantityMinus}
                          plusClick={this.handleQuantityPlus}/>

                        <div className="ShoppingBagPriceWrap">
                          <label>UNIT PRICE:</label>
                          <div className="priceWrap">
                            <span className="price beforePromo">
                              <span className="currency">{this.state.product.currency}</span><span className="amount">{this.state.product.price}</span>
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