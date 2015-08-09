React = require "react"

BrandDetails = React.createClass

  render: ->
    return <div className="kiwi-grid divider">
            <div className="kiwi-col l-7-16 m-1">
              <div className="block img"><img src="http://placehold.it/450x280" className="fade-in" /></div>
            </div>
            <div className="kiwi-col l-9-16 m-1">
              <div className="block details">
                <div className="title">Chateau Beychevelle</div>
                <p className="description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris euismod, erat non porttitor consequat, dolor enim molestie eros, ut fringilla augue urna sit amet felis. Quisque imperdiet orci at nulla sodales, et porttitor leo porta. Nullam neque arcu, mollis bibendum lobortis non, mattis in lorem. Aliquam nec mollis turpis. Ut vulputate pellentesque gravida. className aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed consectetur elit quis lectus dapibus, sed tincidunt nisi elementum.</p>
                <p className="discover">Discover the latest collection at your nearest <a href="#" className="underline">DFS store</a>.</p>
              </div>
            </div>
          </div>

module.exports = BrandDetails