React = require "react"
ProductFilterActions = require "../actions/ProductFilterActions.cjsx"

RefinerList = React.createClass

  getInitialState: ->
    {refiners: @props.refiners}

  handleClick: (itemID) ->

    ProductFilterActions.removeProductRefiner {itemID: itemID}


  render: ->

    list = Object.keys(this.state.refiners).map (item) =>
      return  <div className="title selectedFilter" data-target={item} key={item.id}>
                  {this.state.refiners[item]}
                <span className="close" onClick={this.handleClick.bind(null,item)}>×</span>
              </div>

    return  <div> {list}</div>


module.exports = RefinerList