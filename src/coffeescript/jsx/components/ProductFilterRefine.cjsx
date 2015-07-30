React = require "react"
RefineGroup = require "./RefineGroup.cjsx"
RefinerList = require "./RefinerList.cjsx"
# ProductFilterActions = require "../actions/ProductFilterActions.cjsx"

ProductFilterStore = require "../stores/ProductFilterStore.cjsx"

getRefinerList = ->
  # console.log ProductFilterStore.getSeletedRefiners()
  selectedRefiners: ProductFilterStore.getSeletedRefiners()


ProductFilterRefine = React.createClass

  getInitialState: ->
    getRefinerList()

  componentDidMount: ->
    ProductFilterStore.addChangeListener @handleChange

  componentWillUnmount: ->
    ProductFilterStore.removeChangeListener @handleChange

  handleChange: ->
    console.log "change"
    @setState getRefinerList()


  render: ->
    grapes = [
        id: "grape1"
        label:"Merlot"
      , 
        id: "grape2"
        label: "Sangiovese"
      , 
        id: "grape3"
        label: "Cabearnet Sauvignon"
      , 
        id: "grape4"
        label: "pinot noir"
      , 
        id: "grape5"
        label: "Sauvignon Blanc"
      , 
        id: "grape6"
        label: "Bordeaux Red Blend"
      ,
        id: "grape7"
        label: "riesling"
    ]

    return  <div className="list expandable refineResults">
              <div className="title menu-title kiwi-visible-m kiwi-visible-s">
                REFINE RESULTS 
              </div>

              <div className="content">
                <div className="list selectedFilters">
                    <div className="title menu-title desktop kiwi-hidden-m kiwi-hidden-s">REFINE RESULTS</div>
                    <div className="content"  style={{display:"block"}}>
                      <RefinerList refiners={this.state.selectedRefiners} />
                    </div>
                </div>
                <div className="list submenu expandable expanded">
                  <div className="title">By grape Varietal</div>
                  <div className="content filters"  style={{display:"block"}}>
                    <RefineGroup items={grapes}
                      selectedRefiners={this.state.selectedRefiners}
                      category="Grape Varietal"
                      categoryID="grape_varietal"
                    />
                  </div>
                </div>
              </div>
                
            </div>


module.exports = ProductFilterRefine