React = require "react"

ShoppingbagHeader = React.createClass

  render: ->
     return <header className="ShoppingBagHeader purchaseLimits">
                <div className="primary-title">Duty-Free Allowance Options: 
                  <span className="icon-tooltip icon-appendInline"></span>
                </div>
                <div className="limits">
                  <div className="kiwi-grid allowanceOptionWrap">
                    <div className="kiwi-col l-1-3">
                      <div className="ShoppingBagOption under-allowance">
                        <div className="option-nb">1</div>
                        <div className="ShoppingBagLimit"><span className="limit">1L</span><span className="divider">  </span><span className="type">wines</span></div>
                        <div className="ShoppingBagLimit"><span className="limit">1L</span><span className="divider">  </span><span className="type">spirits</span></div>
                        <div className="ShoppingBagLimit"><span className="limit">1L</span><span className="divider">  </span><span className="type">beer</span></div>
                      </div>
                    </div>
                    <div className="kiwi-col l-1-3">
                      <div className="ShoppingBagOption">
                        <div className="option-nb">2</div>
                        <div className="ShoppingBagLimit"><span className="limit">2L</span><span className="divider">  </span><span className="type">wines</span></div>
                        <div className="ShoppingBagLimit"><span className="limit">1L</span><span className="divider">  </span><span className="type">beer</span></div>
                      </div>
                    </div>
                    <div className="kiwi-col l-1-3">
                      <div className="ShoppingBagOption">
                        <div className="option-nb">3</div>
                        <div className="ShoppingBagLimit"><span className="limit">1L</span><span className="divider">  </span><span className="type">wines</span></div>
                        <div className="ShoppingBagLimit"><span className="limit">2L</span><span className="divider">  </span><span className="type">beer</span></div>
                      </div>
                    </div>
                  </div>
                </div>
              </header>    

module.exports = ShoppingbagHeader