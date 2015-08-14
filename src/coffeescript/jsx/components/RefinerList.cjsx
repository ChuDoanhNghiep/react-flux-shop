React = require "react"
ProductFilterActions = require "../actions/ProductFilterActions.cjsx"

RefinerList = React.createClass

  handleClick: (item) ->

    ProductFilterActions.removeProductRefiner item


  render: ->

    list = Object.keys(@props.refiners).map (itemID) =>
      refiner = @props.refiners[itemID]
      return  <div className="title selectedFilter" key={itemID}>
                  {refiner.itemLabel}
                <span className="close" onClick={this.handleClick.bind(null,refiner)}>×</span>
              </div>

    return  <div> {list}</div>


module.exports = RefinerList