React = require "react"
classNames = require "classnames"
TimeoutTransitionGroup = require "../helper/timeout-transition-group.js"
ProductListAPI = require "../utils/ProductListAPI.coffee"
Product = require "./Product.cjsx"
# ProductFilterStore = require "../stores/ProductFilterStore.cjsx"
ProductListStore = require "../stores/ProductListStore.cjsx"

ProductList = React.createClass
      
  setGridView: (event) ->
    event.preventDefault()
    @setState 
      viewType: "grid"

  setListView: (event) ->
    event.preventDefault()
    @setState 
      viewType: "list"

  getInitialState: ->

    return {viewType: "grid", products: ProductListStore.getProductList(), sorter: @props.selectedSorter}

  # componentWillMount: ->
  #   @setState 
  #     products: ProductListStore.getProductList()

  componentDidMount: ->
    # ProductFilterStore.addChangeListener @handleChange
    ProductListStore.addChangeListener @handleChange

  componentWillUnmount: ->
    # ProductFilterStore.removeChangeListener @handleChange
    ProductListStore.removeChangeListener @handleChange

  handleChange: ->
    console.log "product list change"
    @setState 
      products: ProductListStore.getProductList()

  render: ->
 
    elemClass = @state.viewType + " " + "productsList"
    gridIconClass = if @state.viewType is "grid" then "active" else "inactive"
    listIconClass = if @state.viewType is "list" then "active" else "inactive"
    noProductClass = classNames "no-product", {"show": @state.products.length is 0}

    items = @state.products.map (product) =>
      return <Product key={product.id} product={product} />

    return  <section className={elemClass}>
        <header className="kiwi-hidden-m kiwi-hidden-s">
          <div className="listView">
            <div className="title">View</div>
              <div className="choice">
                <a href="#" title="view in grid" data-typeview="grid" className={gridIconClass} onClick={this.setGridView}>
                  <img src="./images/icons/image.png" className="display" />
                  <img src="./images/icons/image-active.png" className="hidden" />
                </a>
                <a href="#" title="view in list" data-typeview="list" className={listIconClass} onClick={this.setListView}>
                  <img src="./images/icons/list.png" className="display" />
                  <img src="./images/icons/list-active.png" className="hidden" />
                </a>
              </div>
          </div>
        </header>
        <div className="kiwi-grid">
          <div className="products">
            <TimeoutTransitionGroup transitionName="product" enterTimeout={300} leaveTimeout={0}>
              {items}
            </TimeoutTransitionGroup>
          </div>
        </div>
        <div className={noProductClass}>
          There is no product to display.
        </div>
      </section>


module.exports = ProductList