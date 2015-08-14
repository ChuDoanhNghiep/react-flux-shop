React = require "react"
RefineGroup = require "./RefineGroup.cjsx"
RefinerList = require "./RefinerList.cjsx"

ProductFilterStore = require "../stores/ProductFilterStore.cjsx"
ProductListStore = require "../stores/ProductListStore.cjsx"

# getSelectedRefinerList = ->
  # console.log ProductFilterStore.getSeletedRefiners()
  # selectedRefiners: ProductFilterStore.getSeletedRefiners()


ProductFilterRefine = React.createClass

  getInitialState: ->
    refinerList: ProductListStore.getProductRefiners()
    selectedRefiners: ProductFilterStore.getSeletedRefiners()

  componentDidMount: ->
    ProductFilterStore.addChangeListener @handleFilterChange
    ProductListStore.addChangeListener @handleListChange

  componentWillUnmount: ->
    ProductFilterStore.removeChangeListener @handleFilterChange
    ProductListStore.addChangeListener @handleListChange

  handleFilterChange: ->
    console.log "change"
    @setState 
      selectedRefiners: ProductFilterStore.getSeletedRefiners()

  handleListChange: ->
    @setState
      refinerList: ProductListStore.getProductRefiners()

  render: ->
    
    if @state.refinerList
      refinerGroups = Object.keys(@state.refinerList).map (prop) =>
        items = @state.refinerList[prop]
        
        return  <div className="list submenu expandable">
                  <div className="title">By {prop}</div>
                  <div className="content filters">
                    <RefineGroup items={items}
                      selectedRefiners={this.state.selectedRefiners}
                      category={prop}
                      categoryID={prop}
                      key={prop.id}
                    />  
                  </div>
                </div>    

      return  <div className="list expandable refineResults">
                <div className="title menu-title kiwi-visible-m kiwi-visible-s">
                  REFINE RESULTS 
                </div>

                <div className="content">
                  <div className="list selectedFilters">
                      <div className="title menu-title desktop kiwi-hidden-m kiwi-hidden-s">REFINE RESULTS</div>
                      <RefinerList refiners={this.state.selectedRefiners} />
                  </div>
                  {refinerGroups}
                </div>
                  
              </div>

    else
      return <div />

module.exports = ProductFilterRefine