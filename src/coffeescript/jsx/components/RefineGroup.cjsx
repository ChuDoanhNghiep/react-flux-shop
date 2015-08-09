React = require "react"
ProductFilterActions = require "../actions/ProductFilterActions.cjsx"

RefineGroup = React.createClass
  
  getInitialState: ->
    selectedItems: @props.selectedRefiners
    itemList: @props.items

  componentWillReceiveProps: ->
    @setState
      itemList: @props.items

  handleClick: (event) ->
    item = {itemID: event.target.id, itemLabel:event.target.value, category: @props.category}

    if event.target.id of @state.selectedItems
      ProductFilterActions.removeProductRefiner(item)

    else
      ProductFilterActions.addProductRefiner(item)

  clearAll: (event)->
    event.preventDefault()
    ProductFilterActions.clearProductRefiner {}


  handleInput: (event) ->
    input = event.target.value

    matchedList = @props.items.filter (elem, index, array) ->
      elem.toLowerCase().indexOf(input) > -1

    @setState {itemList: matchedList}

  render: ->

    lists = @state.itemList.map (item, index) =>
      itemId = @props.category + index

      return  <li className="refine" key={item}><label className="cfe">
                <input type="checkbox" value={item} className="cfe-styled" id={itemId} onChange={this.handleClick} checked={itemId of @state.selectedItems } />
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