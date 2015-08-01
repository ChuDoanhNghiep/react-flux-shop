class MobileMenu

  defaults=
    class: 'opened'
    cb: ()->
      return
    debug: 0

  # stopEvent = (ev)->
  #   ev.stopPropagation()
  #   ev.preventDefault()

  constructor: (@selector, options)->
    @options = $.extend true, {}, defaults, options
    Debug.log.call @, 1, @constructor.name+' > constructor'
    Debug.log.call @, 2, @constructor.name+' >> selector = ', @selector
    $('html, body').on 'click', '[toggle="fashion-mobile-left-menu"]', @onClickMenuButton

  onClickMenuButton: (click)=>
    Debug.log.call @, 1, @constructor.name+' > onClickMenuButton'
    Debug.log.call @, 2, @constructor.name+' >> eventTarget = ', $(click.currentTarget)
    stopEvent click

    @toggleMenu @selector
    return

  toggleMenu: (el)->
    Debug.log.call @, 1, @constructor.name+' > toggleMenu'
    if @isOpened el then @close el else @open el
    return

  isOpened: (el)->
    isOpened = el.hasClass @options['class']
    Debug.log.call @, 2, @constructor.name+' >> isOpened = ', isOpened
    return isOpened

  open: (el)->
    Debug.log.call @, 1, @constructor.name+' > open'
    Debug.log.call @, 2, @constructor.name+' >> el = ', el

    el.addClass @options['class']
    $ 'body, .main-header'
      .addClass 'menu-left-'+@options['class']
    # fix for the issue of menu not showing from the top when opening
    $(window).scrollTop 0
    return

  close: (el)->
    Debug.log.call @, 1, @constructor.name+' > close'
    Debug.log.call @, 2, @constructor.name+' >> el = ', el
    el.removeClass @options['class']
    $ 'body, .main-header'
      .removeClass 'menu-left-'+@options['class']
    return

global.MobileMenu = MobileMenu