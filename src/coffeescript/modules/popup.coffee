class Popup
  defaults=
    class: 'opened'
    debug: 0
    delay:
      open: 1000
      close: 5000
    speed: 1000
    cb: ()->
      return

  # stopEvent = (ev)->
  #   ev.stopPropagation()
  #   ev.preventDefault()

  constructor: (@selector, options)->
    @options = $.extend true, {}, defaults, options
    Debug.log.call @, 1, @constructor.name+' > constructor'

    @selector.on 'click', '.close', @onClickClose
    window.setTimeout @open, @options.delay.open
    window.setTimeout @close, @options.delay.close

  onClickClose: (click)=>
    Debug.log.call @, 1, @constructor.name+' > onClickClose'
    Debug.log.call @, 2, @constructor.name+' >> click = ', click
    @close $(click.currentTarget).parent(@selector)

  open: (el)=>
    Debug.log.call @, 1, @constructor.name+' > open'
    Debug.log.call @, 2, @constructor.name+' >> el = ', el
    el = el || @selector

    el.siblings '.arrow'
      .fadeIn @options.speed

    el.fadeIn @options.speed, ()=>
      el.addClass @options.class
      

  close: (el)=>
    Debug.log.call @, 1, @constructor.name+' > close'
    Debug.log.call @, 2, @constructor.name+' >> el = ', el
    el = el || @selector
    el.siblings '.arrow'
      .fadeOut @options.speed
    el.fadeOut @options.speed, ()=>
      el.removeClass @options.class

global.Popup = Popup