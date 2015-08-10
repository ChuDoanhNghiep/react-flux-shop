React = require "react"
classNames = require "classnames"

ProductListCategorySubMenu = React.createClass

  render: ->

    list = this.props.list.map (i) =>
      url = "#/" + this.props.title + "/" + i
      titleClass = classNames "title", {"current": @props.current and @props.active is i.toLowerCase()}
      return <a href={url} className={titleClass}> {i} </a>

    titleUrl = "#/" + this.props.title
    allTitleClass = classNames "title", {"current": @props.current and not @props.active}

    return  <div className="list expandable" ref="expandable">
              <div className="title">{this.props.title}</div>
              <div className="content submenu">
                {list}
                <a href={titleUrl} className={allTitleClass}>All {this.props.title}</a>
              </div>
            </div>

module.exports = ProductListCategorySubMenu