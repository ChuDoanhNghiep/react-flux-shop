React = require "react"
classNames = require "classnames"

ShoppingbagHeader = React.createClass

  getInitialState: ->
    label: @props.label

  render: ->

    label1 = classNames "ShoppingBagOption", {"under-allowance": this.state.label.type is 1, "over-allowance": this.state.label.type is 1 and this.state.label.over}
    label2 = classNames "ShoppingBagOption", {"under-allowance": this.state.label.type is 2, "over-allowance": this.state.label.type is 2 and this.state.label.over}
    label3 = classNames "ShoppingBagOption", {"under-allowance": this.state.label.type is 3, "over-allowance": this.state.label.type is 3 and this.state.label.over}

    return <header className="ShoppingBagHeader purchaseLimits">
                <div className="primary-title">Duty-Free Allowance Options: 
                  <span className="icon-tooltip icon-appendInline"></span>
                </div>
                <div className="limits">
                  <div className="kiwi-grid allowanceOptionWrap">
                    <div className="kiwi-col l-1-3">
                      <div className={label1}>
                        <div className="option-nb">1</div>
                        <div className="ShoppingBagLimit"><span className="limit">1L</span><span className="divider">  </span><span className="type">wines</span></div>
                        <div className="ShoppingBagLimit"><span className="limit">1L</span><span className="divider">  </span><span className="type">spirits</span></div>
                        <div className="ShoppingBagLimit"><span className="limit">1L</span><span className="divider">  </span><span className="type">beer</span></div>
                      </div>
                    </div>
                    <div className="kiwi-col l-1-3">
                      <div className={label2}>
                        <div className="option-nb">2</div>
                        <div className="ShoppingBagLimit"><span className="limit">2L</span><span className="divider">  </span><span className="type">wines</span></div>
                        <div className="ShoppingBagLimit"><span className="limit">1L</span><span className="divider">  </span><span className="type">beer</span></div>
                      </div>
                    </div>
                    <div className="kiwi-col l-1-3">
                      <div className={label3}>
                        <div className="option-nb">3</div>
                        <div className="ShoppingBagLimit"><span className="limit">1L</span><span className="divider">  </span><span className="type">wines</span></div>
                        <div className="ShoppingBagLimit"><span className="limit">2L</span><span className="divider">  </span><span className="type">beer</span></div>
                      </div>
                    </div>
                  </div>
                </div>
              </header>    

module.exports = ShoppingbagHeader