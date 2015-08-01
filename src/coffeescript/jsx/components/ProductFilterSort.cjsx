React = require "react"
ProductFilterActions = require "../actions/ProductFilterActions.cjsx"

ProductFilterSort = React.createClass

  getInitialState: ->
    {selectedValue: @props.selectedFilter, selectedLabel: " Shop Recommended"}

  handleChange: (selected) ->
    @setState {selectedValue: selected.value, selectedLabel: selected.label}
    ProductFilterActions.setProductListFilter selected.value
    # console.log selected.value
  
  render: ->

    config = [
        value: "shop_recommended"
        label: " Shop Recommended"
      ,
        value: "price_ascending"
        label: " Price Low to High"
      ,
        value: "price_descending"
        label: " Price High to Low"
      ,
        value: "A_to_Z"
        label: " A to Z"
      ,
        value: "Z_to_A"
        label: " Z to A"                  
    ]

    buttons = config.map (btn) =>
      return  <li className="sort" key={btn.id}>
                <label className="cfe">
                  <input type="radio" 
                    name="sort"
                    value={btn.value} 
                    checked={btn.value is this.state.selectedValue} 
                    className="cfe-styled"
                    onChange={this.handleChange.bind(null, btn)} 
                  />
                    {btn.label}
                </label>

              </li>

    return  <div className="list expandable refineResults expanded">
              <div className="title menu-title kiwi-visible-m kiwi-visible-s">
                SORT BY
              </div>
              <div className="content" style={{display:"block"}}>

                <div className="list selectedFilters">
                  <div className="title menu-title desktop kiwi-hidden-m kiwi-hidden-s">SORT BY</div>
                </div>

                <div className="list submenu expandable sorting-desktop expanded">
                  <div className="title"> {this.state.selectedLabel} </div>
                    <div className="content" style={{display:"block"}}>
                      <ul className="submenu">
                        {buttons}
                      </ul>
                    </div>
                </div>
              </div>
            </div>

module.exports = ProductFilterSort