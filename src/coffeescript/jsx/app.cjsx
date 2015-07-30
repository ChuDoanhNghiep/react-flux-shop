# @cjsx React.DOM

window.React = require "react"
ProductListData = require "./ProductListData.coffee"
ProductFilterSort = require "./components/ProductFilterSort.cjsx"
ProductFilterRefine = require "./components/ProductFilterRefine.cjsx"
ProductList = require "./components/ProductList.cjsx" 

ProductListData.init()

App = React.createClass
  
  render: ->
    return <div className="kiwi-grid">
                  <div className="kiwi-col l-2-7 m-1">
                    <div className="productsFilter expand-menu-adjust cfe-form">
                      <div className="menuwrap">
                        <ProductFilterSort selectedFilter="shop_recommended" />
                        <ProductFilterRefine />
                      </div>
                    </div>
                  </div>

                  <div className="kiwi-col l-5-7 m-1">
                    <div className="preorder-message">
                      <div className="text">
                        You can now shop items online from our wines and spirits
                        <div data-tip="tooltip" data-tip-position="right" className="icon-tooltip icon-appendInline">
                          <div className="tooltip">
                            <p>Message tooltip</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <ProductList selectedFilter="shop_recommended" />
                  </div>
                </div>    

ProductListApp = {}

ProductListApp.start = ->

  React.render <App />, document.getElementById "product-listing"

module.exports = ProductListApp.start()