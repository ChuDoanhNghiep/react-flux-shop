React = require "react"
ProductListCategorySubMenu = require "./ProductListCategorySubMenu.cjsx"

ProductListCategoryMenu = React.createClass

  # getInitialState: ->


  render: ->
    listObj = window.productCategoryList

    menulist = Object.keys(listObj).map (item) =>
      return <ProductListCategorySubMenu title={item} list={listObj[item]} />


    return  <div className="listCategories">
              <div className="menuwrap">
                {menulist}
              </div>
            </div>

module.exports = ProductListCategoryMenu