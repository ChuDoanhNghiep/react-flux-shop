class Product
  "use strict"

  defaults =
    breakpoints:
      desktop: 960
    class: 'active'
    debug: 0
    details: false
    wishlist:
      addTo: (productId)->
        # console.log 'callback addToWishlist with id = ', productId
        window.AddToWishlist productId
        return
      tip:
        active: 'This is on your Wish List'
        inactive: 'Add to Wish List'

  @tips = []
  @loaders =
    onClickWishlist: (click)->
      stopEvent click
      Debug.log.call @, 4, @constructor.name+' > onClickWishlist'
      target = $ click.currentTarget
      target.toggleClass @options.class
      productId = target.data 'productid'

      if target.hasClass @options.class
        target.trigger 'activate'
        @options.wishlist.addTo(productId)
      else
        target.trigger 'deactivate'
      return

    onChangeWishListTip: (ev)->
      Debug.log.call @, 4, @constructor.name+' > onChangeWishListTip'
      target = $ ev.currentTarget
      for tip, index in Product.tips
        if $(tip.target).is(target)
          Product.toggleTipMessage.call this, target, tip
      return

    onClickZoomBox: (click)->
      Debug.log.call @, 4, @constructor.name+' > onClickZoomBox'
      stopEvent click
      
      container = $ click.currentTarget
      .parents('.swipe.slider')
      .parent()

      if !container.hasClass('zoomed')
        $ 'html,body'
        .css 
          height: '100%'
          overflow: 'hidden'

        container
        .find '.zoom-message'
        .html('<img src="/static/img/zoom-minus-x2.png" class="zoom-icon"/>')
        .stop true,true
        .show()
        .fadeOut 5000
      else
        $ 'html,body'
        .css 
          height: ''
          overflow: ''
          
      container.toggleClass 'zoomed'

      index = mySwipe.getPos()
      mySwipe.kill()

      window.mySwipe = Swipe container.find('.slider').get(0),
        speed: 800
        continuous: true
        startSlide: index
        callback: (pos)=>
          bullets = @selector.find('.swipe-controls.bullets .bullet')
          bullets.removeClass('active')
          bullets.eq(pos).addClass('active')
          true

    inMagnifierThumb: (mouseenter)->
      Debug.log.call @, 4, @constructor.name+' > inMagnifierThumb'
      target = $ mouseenter.currentTarget
      target.parents '.magnifier'
      .find '.magnifier-preview'
      .removeClass 'hidden'
      .addClass 'active'
      return

    outMagnifierThumb: (mouseleave)->
      Debug.log.call @, 4, @constructor.name+' > outMagnifierThumb'
      target = $ mouseleave.currentTarget
      target.parents '.magnifier'
      .find '.magnifier-preview'
      .removeClass 'active'
      .addClass 'hidden'
      return

    onclickDataSlide: (click)->
      Debug.log.call @, 4, @constructor.name+' > onclickDataSlide'
      stopEvent click
      index = $ click.currentTarget
      .data 'slide'

      switch index
        when 'next' then mySwipe.next()
        when 'prev' then mySwipe.prev()
        else mySwipe.slide index

      return

    loadTip: ()->
      Debug.log.call @, 4, @constructor.name+' > loadTip'

      tooltip = new Tooltip @selector.find(".actions"),
        setup: (idx, tip)->
          Product.tips[idx] = tip
      
      return

    loadTipClick: ()->
      Debug.log.call @, 4, @constructor.name+' > loadTipClick'

      tooltip = new Tooltip @selector.find(".actions"),
        setup: (idx, tip)->
          Product.tips[idx] = tip
        events: 'click'
      
      return

    loadCurrencyTip: ()->

      tooltip = new Tooltip @selector.find(".detail")


    loadQuickView: ()->
      # Debug.log.call @, 4, @constructor.name+' > loadQuickView'
      # @selector.find '.actions .quickview'
      # .on 'click', (click)->
      #   stopEvent click
      #   return false


      # .magnificPopup
      #   type: 'inline'
      #   removalDelay: 500
      #   disableOn: 961
      #   callbacks:
      #     beforeOpen: ()->
      #       this.st.mainClass = this.st.el.attr('data-effect')
      #     updateStatus: (data)=>

      return

    loadSwipeSlider: ()->
      Debug.log.call @, 4, @constructor.name+' > loadSwipeSlider'
      window.mySwipe = Swipe @selector.find('.slider').get(0),
        speed: 800
        continuous: true
        callback: (pos)=>
          bullets = @selector.find('.swipe-controls.bullets .bullet')
          bullets.removeClass('active')
          bullets.eq(pos).addClass('active')
          true

      return

    loadMagnifier: ()->
      Debug.log.call @, 4, @constructor.name+' > loadMagnifier'

      # Magnify = require 'profero-china~magnify@0.0.3'
      # @selector.find '.component.magnify'
      # .each (i, el)->
      #   magnify = new Magnify el

    loadQuantitySelector: ()->
      Debug.log.call @, 4, @constructor.name+' > loadQuantitySelector'
      # if not @selector.data('loaded')
      #   quantitySelector = new QuantitySelector @selector

  constructor: (@selector, options)->
    @options = $.extend true, {}, defaults, options
    Debug.log.call @, 1, @constructor.name+' > constructor'
    Debug.log.call @, 3, @constructor.name+' >> this', this
    @setup()

    $ window
    .on 'resize', @debounce(@onResize, 500)
    return

  debounce: (func, threshold, execAsap)->
    timeout = null

    (args...) ->
      obj = this
      delayed = ->
        func.apply(obj, args) unless execAsap
        timeout = null
      if timeout
        clearTimeout(timeout)
      else if (execAsap)
        func.apply(obj, args)
      timeout = setTimeout delayed, threshold || 100  

  setup: (settings)->
    Debug.log.call @, 1, @constructor.name+' > setup'
    settings = createSettings.call this, settings
    @loader = new ProductFeatures @selector, settings, @options

    events = createEvents.call this
    @event = new ProductEvents @selector, events, @options

    @selector.data 'loaded', true

  createSettings = (settings)->
    Debug.log.call @, 3, @constructor.name+' > createSettings'
    settings = settings || {}

    if !@options.details
      settings.loadCurrencyTip ?= true
      
      if @isDesktop()
        settings.loadTip ?= true
        settings.loadQuickView ?= true
      # else 
      #   settings.loadTipClick ?= true
    else
      settings.loadSwipeSlider ?= true
      settings.loadQuantitySelector ?= true
      settings.loadCurrencyTip ?= true
      if @isDesktop()
        settings.loadTip ?= true
        settings.loadMagnifier ?= true
      else 
        settings.loadTipClick ?= true

    return settings

  createEvents = ()->
    Debug.log.call @, 3, @constructor.name+' > createEvents'
    events = {}

    if !@options.details
      events.onClickWishlist = {event:'click', delegate:'.actions .wishlist'}
      events.onChangeWishListTip = {event:'activate deactivate', delegate:'.actions .wishlist'}
    else
      events.onclickDataSlide = {event:'click', delegate:'[data-slide]'}

      if !@isDesktop()
        events.onClickZoomBox = {event:'click', delegate:'.primary .slide'}

    return events
 
  isDesktop: ()->
    $(window).width() > @options.breakpoints.desktop

  @toggleTipMessage:(el, tip)->
    if el.hasClass @options.class 
      tip.message(@options.wishlist.tip.active)
    else
      tip.message(@options.wishlist.tip.inactive)
    return

  onResize: ()=>
    Debug.log.call @, 2, @constructor.name+' > onResize'
    @kill()

    @setup
      loadMagnifier:false
      loadQuantitySelector:false

    return

  kill: ()=>
    Debug.log.call @, 1, @constructor.name+' > kill'
    @event.unload()

    return


class ProductLoader
  "use strict"

  defaults = 
    debug: 0

  loaders : {}

  constructor: (@selector, @settings, options)->
    @options = $.extend true, {}, defaults, options
    Debug.log.call @, 2, @constructor.name+' >> options = ', @options
    Debug.log.call @, 2, @constructor.name+' >> selector = ', @selector.selector
    @load()

  load: ()->
    Debug.log.call @, 2, @constructor.name+' > load ', @settings
    $.each @settings, (idx, value)=>
      func = Product.loaders[idx]
      if value and typeof func == 'function' then func.call this
    return

class ProductFeatures extends ProductLoader
  "use strict"

  constructor: (@selector, @settings, options)->
    super @selector, @settings, options

  load: ()->
    super @settings

class ProductEvents extends ProductLoader
  "use strict"

  constructor: (@selector, @settings, options)->
    super @selector, @settings, options

  load: ()->
    # surcharge of load
    Debug.log.call @, 2, @constructor.name+' > load ', @settings

    $.each @settings, (idx, value)=>
      func = Product.loaders[idx]
      if typeof func == 'function'
        if value.delegate? 
          @selector.on value.event, value.delegate, (ev)=>
            func.call this, ev
        else if value.filter?
          @selector
          .filter value.filter
          .on value.event, (ev)=>
            func.call this, ev

  unload: ()->
    Debug.log.call @, 2, @constructor.name+' > unload '

    $.each @settings, (idx, value)=>
      func = Product.loaders[idx]
      if typeof func == 'function'
        Debug.log.call @, 3, @constructor.name+' > unload "'+idx+'"',value
        if value.delegate? 
          @selector.off value.event, value.delegate
        else if value.filter?
          @selector
          .filter value.filter
          .off value.event

  add: (obj)->
    $.each obj, (idx, value)=>
      func = Product.loaders[idx]
      if typeof func == 'function'
        if value.delegate? 
          @selector.on value.event, value.delegate, (ev)=>
            func.call this, ev
        else if value.filter?
          @selector
          .filter value.filter
          .on value.event, (ev)=>
            func.call this, ev


pageFunctions = 
  loadDetails: ()->
    selector = $('.page .product.productDetails')
    @product = new Product selector,
      details: true

    selector.find '.sliderWrap'
    .each (idx,el)->
      new ProductSlider $(el), 
        nbSliding: 1
        auto: false
    return

  reloadMagnifier: ()->
    Product.loaders.loadMagnifier.call(@product)
    return

  loadModal: ()->
    selector = $('.mfp-content #modal-quick-view')

    @modalProduct = new Product selector, 
      details: true

    new CustomSelect selector.find(".custom-select")

    selector.find '.sliderWrap'
    .each (idx,el)->
      new ProductSlider $(el), 
        nbSliding: 1
        auto: false

    return

global.Product = Product