React = require "react"

ShoppingbagEmpty = React.createClass
    
  render: ->

    return <div>
              <h2>Your Shopping Bag</h2>
              <p>You can currently Shop and Collect items from our Wines and Spirits and Beauty Collections.</p>
              <div className="steps">
                <div className="kiwi-grid">
                  <div className="kiwi-col l-1-3">
                    <div className="step step-1">
                      <div className="picto">1</div>
                      <div className="text">Add items <br/>to your bag</div>
                    </div>
                  </div>
                  <div className="kiwi-col l-1-3">
                    <div className="step step-2">
                      <div className="picto">2</div>
                      <div className="text">Pay <br/>online</div>
                    </div>
                  </div>
                  <div className="kiwi-col l-1-3">
                    <div className="step step-3">
                      <div className="picto">3</div>
                      <div className="text">Collect <br/>in store</div>
                    </div>
                  </div>
                </div>
              </div>
              <p className="learn-more"><a className="link underline" href="#">Learn more about Shop and Collect</a></p>
              
            </div>

module.exports = ShoppingbagEmpty