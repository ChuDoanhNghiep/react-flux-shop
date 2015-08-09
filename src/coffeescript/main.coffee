# 3rd party libraries
window.$ = window.jQuery = require "jquery"
require "magnific-popup"

# Modules
require "./modules/menu-tabs.coffee"
require "./modules/expandable-menu.coffee"
require "./modules/mobile-menu.coffee"
require "./modules/menu-dropdown.coffee"
require "./modules/sticky-menu.coffee"
require "./modules/tooltip.coffee"
require "./modules/product.coffee"
require "./modules/products-list.coffee"
require "./modules/refine-menu.coffee"
require "./modules/popup.coffee"

require "./pages/page.coffee"

# Reactjs
require "./jsx/MainApp.cjsx"
require "./jsx/HeaderApp.cjsx"
