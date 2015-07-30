React = require "react"
ReactRouter = require "react-router"
Link = ReactRouter.Link

Product = React.createClass
  
  render: ->
    product = @props.product
    url = "#/product/" + product.id

    return <div className="kiwi-col l-1-3 m-1-3 s-1-2">
        <a href={url} className="productLink">
          <div className="product">
            <div className="picture">
              <img src={product.image} alt="nectar Imperial" />
            </div>
            <div className="detail">
              <div className="name">
                <div className="brand-name">{product.brand}</div>
                <div className="product-name">{product.name}</div>
              </div>
              <div className="price no-discount">
                <span className="currency">
                  <span className="symbol-before">›</span>
                    <span className="underline">{product.currency}</span>
                      <span className="amount">{product.price}</span>
                </span>
              </div>
            </div>
            <div className="description">
              {product.description}
            </div>                       
          </div>
        </a>
      </div>

module.exports = Product