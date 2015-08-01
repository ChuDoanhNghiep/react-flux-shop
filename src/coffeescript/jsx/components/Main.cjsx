React = require "react"
ReactRouter = require "react-router"
RouteHandler = ReactRouter.RouteHandler

Breadcrumb = require "./Breadcrumb.cjsx"
BrandDetails = require "./BrandDetails.cjsx"

Main = React.createClass

  getDefaultProps: ->
    pageID: "brand-collection"



  render: -> 
    return  <div className="page" id={this.props.pageID}>
              <div className="area-container">
                <div className="pos-relative">
                    <h1 className="divider GNB-line"> Wine and spirits</h1>
                </div>
                <Breadcrumb />
                <BrandDetails />

                <RouteHandler />

              </div>
            </div>
   

module.exports = Main