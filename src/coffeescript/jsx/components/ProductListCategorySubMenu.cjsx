React = require "react"

ProductListCategorySubMenu = React.createClass

  render: ->

    list = this.props.list.map (i) =>
      url = "#/" + this.props.title + "/" + i
      return <a href={url} className="title"> {i} </a>
    titleUrl = "#/" + this.props.title

    return  <div className="list expandable expanded">
              <div className="title">{this.props.title}</div>
              <div className="content submenu" style={{display: "block"}}>
                {list}
                <a href={titleUrl} className="title">All {this.props.title}</a>
              </div>
            </div>

module.exports = ProductListCategorySubMenu