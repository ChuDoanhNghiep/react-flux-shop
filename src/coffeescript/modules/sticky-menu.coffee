class StickyMenu

  defaults=
    class: 'opened'
    cb: ()->
      return
    debug: 0


  constructor: (@selector, options)->
    @options = $.extend true, {}, defaults, options
    Debug.log.call @, 1, @constructor.name+' > constructor'
    Debug.log.call @, 2, @constructor.name+' >> selector', @selector
    $('html, body').on 'click', '[toggle="sticky-header-menu"]', @onClickMenuButton

  onClickMenuButton: (click)=>
    Debug.log.call @, 1, @constructor.name+' > onClickMenuButton'
    Debug.log.call @, 2, @constructor.name+' >> eventTarget', $(click.currentTarget)
    stopEvent click

    @toggleMenu @selector
    return

  toggleMenu: (el)->
    Debug.log.call @, 1, @constructor.name+' > toggleMenu'
    if @isOpened el then @close el else @open el
    return

  isOpened: (el)->
    Debug.log.call @, 1, @constructor.name+' > isOpened'
    el ?= @selector
    isOpened = $ 'body'
      .hasClass 'sticky-menu-'+@options['class']
    # console.log @constructor.name+' >> isOpened = ', isOpened if @options.debug > 1
    return isOpened

  open: (el)->
    Debug.log.call @, 1, @constructor.name+' > open'
    Debug.log.call @, 2, @constructor.name+' >> el', el
    el.addClass @options['class']
    $ 'body, .main-header'
      .addClass 'sticky-menu-'+@options['class']
    return

  close: (el)->
    Debug.log.call @, 1, @constructor.name+' > close'
    Debug.log.call @, 2, @constructor.name+' >> el', el
    el ?= @selector
    el.removeClass @options['class']
    $ 'body, .main-header'
      .removeClass 'sticky-menu-'+@options['class']
    return

global.StickyMenu = StickyMenu