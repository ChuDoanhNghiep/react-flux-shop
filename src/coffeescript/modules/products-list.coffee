# require "listView.coffee"

$ ->
  # listView = new ListView $('.productsList')
  product = new Product $('.product')


  # Dirty fix for IE8 Product listing resize
  ieOnResize = ()->
    if $('html').hasClass('lte8')
      if $(window).width() <= 960
        listView.toggleView $('[data-typeView=grid]')
        $ '.productsList .kiwi-hidden-m'
        .hide()
      else
        $ '.productsList .kiwi-hidden-m'
        .show()

  $ window
  .resize ieOnResize

  ieOnResize()