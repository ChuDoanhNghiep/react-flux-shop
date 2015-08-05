# @cjsx React.DOM

React = require "react"
ProductListAPI = require "../utils/ProductListAPI.coffee"
Product = require "./Product.cjsx"
# ProductFilterStore = require "../stores/ProductFilterStore.cjsx"
ProductListStore = require "../stores/ProductListStore.cjsx"

ProductList = React.createClass
  
  getProductList: ->
    filter = ProductListStore.getSeletedProductFilter()
    refiners = ProductListStore.getSeletedProductRefiners()
    console.log refiners
    @setState 
      filter: filter
      products: ProductListAPI.getProductListData filter, refiners

  # getProductListFilter: ->
    # @setState
      # filter: ProductListStore.getSeletedProductFilter()
      
  setGridView: (event) ->
    event.preventDefault()
    @setState 
      viewType: "grid"

  setListView: (event) ->
    event.preventDefault()
    @setState 
      viewType: "list"

  getInitialState: ->

    rawData = []
    if @props.category
      rawData = ProductListAPI.getProductByCategory @props.category, @props.subCategory
    else
      rawData = ProductListAPI.getAllProduct()

    if @props.selectedSorter
      rawData = ProductListAPI.getfilteredData rawData, @props.selectedSorter

    # console.log rawData
    return {viewType: "grid", products: rawData, filter: @props.selectedSorter}

  # componentWillMount: ->
  #   @setState 
  #     products: ProductListAPI.getProductListData @state.filter

  componentDidMount: ->
    # ProductFilterStore.addChangeListener @handleChange
    ProductListStore.addChangeListener @handleChange

  componentWillUnmount: ->
    # ProductFilterStore.removeChangeListener @handleChange
    ProductListStore.removeChangeListener @handleChange

  handleChange: ->
    console.log "product list change"
    @getProductList()

  render: ->
    elemClass = @state.viewType + " " + "productsList"
    gridIconClass = if @state.viewType is "grid" then "active" else "inactive"
    listIconClass = if @state.viewType is "list" then "active" else "inactive"

    items = @state.products.map (product) =>
      return <Product key={product.objectID} product={product} />

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
            {items}
          </div>
        </div>
      </section>


module.exports = ProductList