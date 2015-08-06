React = require "react"
ProductFilterActions = require "../actions/ProductFilterActions.cjsx"

RefineGroup = React.createClass
  
  getInitialState: ->
    selectedItems: @props.selectedRefiners
    itemList: @props.items

  handleClick: (event) ->
    item = {itemID: event.target.id, itemLabel:event.target.value, categoryID: @props.categoryID}

    if event.target.id of @state.selectedItems
      ProductFilterActions.removeProductRefiner(item)

    else
      ProductFilterActions.addProductRefiner(item)

  clearAll: (event)->
    event.preventDefault()
    ProductFilterActions.clearProductRefiner {}

    # idArray = Object.keys(@state.selectedItems)
    # for id in idArray
    #   ProductFilterActions.removeProductRefiner {itemID: id}

  handleInput: (event) ->
    input = event.target.value
    console.log input
    matchedList = this.props.items.filter (elem, index, array) ->
      elem.label.toLowerCase().indexOf(input) > -1
    console.log matchedList
    @setState {itemList: matchedList}

  render: ->

    lists = this.state.itemList.map (item, index) =>
      itemId = @props.category + index

      return  <li className="refine"><label className="cfe">
                <input type="checkbox" value={item} className="cfe-styled" id={itemId} onClick={this.handleClick} checked={itemId of @state.selectedItems } />
                {item}
              </label></li>


    return  <ul className="submenu">
              <div className="searchbox">
                <div className="control-group search">
                  <input type="text" className="normal placeholder" onChange={this.handleInput} placeholder={this.props.category} />
                </div>
              </div>
              {lists}
              <a href="#" className="title reverse clear-selection" onClick={this.clearAll}> clear selection </a>
            </ul>


module.exports = RefineGroup