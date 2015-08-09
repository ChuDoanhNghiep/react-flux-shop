React = require "react"
ProductFilterActions = require "../actions/ProductFilterActions.cjsx"

RefinerList = React.createClass

  getInitialState: ->
    {refiners: @props.refiners}

  handleClick: (item) ->

    ProductFilterActions.removeProductRefiner item


  render: ->

    list = Object.keys(this.state.refiners).map (itemID) =>
      refiner = this.state.refiners[itemID]
      return  <div className="title selectedFilter" key={itemID}>
                  {refiner.itemLabel}
                <span className="close" onClick={this.handleClick.bind(null,refiner)}>×</span>
              </div>

    return  <div> {list}</div>


module.exports = RefinerList