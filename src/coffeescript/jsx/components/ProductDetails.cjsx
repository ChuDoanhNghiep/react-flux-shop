React = require "react"
Notification = require "react-notification"
classNames = require "classnames"
QuantityChoice = require "./QuantityChoice.cjsx"
ProductListAPI = require "../utils/ProductListAPI.coffee"

ProductDetailsStore = require "../stores/ProductDetailsStore.cjsx"
ProductDetailsActions = require "../actions/ProductDetailsActions.cjsx"

getSelectedQuantity = ->
  ProductDetailsStore.getSeletedQuantity()

updateInventory = (id, num) ->
  ProductListAPI.updateProductInventory id, num

ProductDetails = React.createClass

  updateShoppingbagBtn: ->
    if @state.product.inventory is 0
      @setState
        shoppingbagBtnDisabled: true
        shoppingbagBtn: "sold out"

  getInitialState: ->
    product: ProductListAPI.getProductByID @props.params.id
    selectedQuantity: 1
    shoppingbagBtnDisabled: false
    shoppingbagBtn: "Add to Shopping bag"
    notificationVisible: false
    notificationMsg: ""

  componentDidMount: ->
    ProductDetailsStore.addChangeListener @handleQuantityChange
    this.updateShoppingbagBtn()      

  componentWillUnmount: ->
    ProductDetailsStore.removeChangeListener @handleQuantityChange

  handleQuantityChange: ->
    @setState 
      selectedQuantity: getSelectedQuantity()

  shoppingbagClick: ->
    if @state.shoppingbagBtnDisabled
      return

    @setState
      product: ProductListAPI.getProductByID @props.params.id

    num = @state.product.inventory - @state.selectedQuantity
    if num >= 0
      ProductDetailsActions.addToShoppingbag @state.selectedQuantity
      updateInventory(@state.product.id, num)

      updatedProduct = @state.product
      updatedProduct.inventory = num

      @setState
        product: updatedProduct
      # this.updateShoppingbagBtn()

    else
      @setState
        shoppingbagBtnDisabled: true
        notificationVisible: true
        notificationMsg: "Only " + @state.product.inventory + " items left in store, please select less"

  handleNotification: ->
    @setState
      shoppingbagBtnDisabled: false
      notificationVisible: false
      notificationMsg: ""

  render: ->
    shoppingbagBtnClass = classNames "button action expand", {"disabled": this.state.shoppingbagBtnDisabled}

    return  <section id="tap-enlarge" className="product productDetails magnifier">
            <div className="kiwi-grid">
              <div className="kiwi-col l-1-2 m-1">  
                <div className="preorder-product-message">
                  <div className="text">
                    This item is available for Shop & Collect upon your return to Singapore Airport
                    <div className="icon-tooltip icon-appendInline"></div>
                  </div>
                </div>
                <div className="images">
                  <img src={this.state.product.image} />
                </div>
              </div>
              <div className="kiwi-col l-1-2 m-1">
                <div className="details">
                  <div className="reference">
                    <div className="brand">{this.state.product.brand}</div>
                    <div className="name">{this.state.product.name}</div>
                    <div className="code">#{this.state.product.sku}</div>
                  </div>
                  <div className="price no-discount">
                    <span className="currency">
                      <span className="underline">{this.state.product.currency}</span>
                      <span className="amount">{this.state.product.price}</span>
                    </span>
                  </div>
                  <div className="custom" data-quantity={this.state.selectedQuantity}>
                    <QuantityChoice />
                  </div>
                  <div className="actions">
                    <div className="kiwi-grid">
                      <div className="kiwi-col l-1-2 m-1">
                        <div className="action addToShoppingbag" onClick={this.shoppingbagClick}>
                          <a className={shoppingbagBtnClass}>
                            <div className="icon-shoppingbag-white icon-prependInline">
                            </div>
                            {this.state.shoppingbagBtn}
                          </a>
                        </div>
                        <Notification 
                          isActive={this.state.notificationVisible} 
                          message={this.state.notificationMsg}
                          action="close"
                          onClick={this.handleNotification}/>
                      </div>
                      <div className="kiwi-col l-1-2 m-1">
                        <div className="action addToWishlist"><a data-tip="Save to Wish List to create your personal list of products and gifts" data-tip-position="top" className="button black expand">
                            <div className="icon-heart-base64 icon icon-prependInline">
                            </div>Add to wish list</a></div>
                      </div>
                    </div>
                  </div>
                  <div className="extra primary">
                    <div className="icon-pricetag icon-prependInline">
                    </div>Buy 2, get 1 free
                  </div>
                  <div className="availability">
                    <div className="icon-pin-gray icon-inline">
                    </div>This product is currently available at a DEMO store. <a href="#" className="underline">Find it now</a>
                  </div>
                  <div className="description accordion-menu">
                    <div className="list expandable expanded">
                      <div className="title">Details</div>
                      <div className="content">{this.state.product.description}</div>
                    </div>
                  </div>
                  <div className="share">
                    <div className="kiwi-grid">
                      <div className="kiwi-col l-1-2 m-1">
                        <div className="asking">Have a question? <a href="#" className="underline">Email us</a></div>
                      </div>
                      <div className="kiwi-col l-1-2 m-1">
                        <div className="share-button">share:<a href="#">facebook</a></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </section>

module.exports = ProductDetails