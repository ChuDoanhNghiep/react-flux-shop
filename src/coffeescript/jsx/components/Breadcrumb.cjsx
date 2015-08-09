React = require "react"

Breadcrumb = React.createClass

  render: ->
    return <nav className="breadcrumb">
            <ul className="list">
              <li className="element"><a href="#">Home</a></li>
              <li className="element divider"><a href="#">Wine &amp; Spirits</a></li>
            </ul>
          </nav>

module.exports = Breadcrumb