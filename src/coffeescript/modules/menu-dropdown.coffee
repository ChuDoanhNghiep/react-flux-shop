class DropdownMenu
  defaults=
    class: 'opened'
    speed: 200
    debug: 0
    overlay: false

  # stopEvent = (ev)->
  #   ev.stopPropagation()
  #   ev.preventDefault()

  constructor: (@selector, options)->
    @options = $.extend true, {}, defaults, options
    Debug.log.call @, 1, @constructor.name+' > constructor'
    Debug.log.call @, 2, @constructor.name+' >> selector = ', @selector
    @selector.on 'click', '.dropdown-text', @onClickTitle

  onClickElseWhere: (click)=>
    Debug.log.call @, 1, @constructor.name+' > onClickElseWhere'
    stopEvent click
    @close @selector
    return
    
  onClickTitle: (click)=>
    Debug.log.call @, 1, @constructor.name+' > onClickTitle'
    stopEvent click
    @toggle $(click.currentTarget).parent()
    return

  toggle: (el)->
    Debug.log.call @, 1, @constructor.name+' > toggle'
    Debug.log.call @, 2, @constructor.name+' >> el = ', el
    if @isOpened el then @close el else @open el
    return

  isOpened: (el)->
    opened = el.hasClass @options.class
    Debug.log.call @, 1, @constructor.name+' >> isOpened = ', opened
    return opened

  open: (el)->
    Debug.log.call @, 1, @constructor.name+' > open'
    content = el.children '.dropdown-list'
    if @options.overlay then @addOverlay()

    content.animate {height: 'show'}, @options.speed, ()=>
      el.addClass @options.class

    $ 'html,body'
      .not @selector
      .on 'click', @onClickElseWhere
    return

  addOverlay: ()->
    Debug.log.call @, 1, @constructor.name+' > addOverlay'
    $ '<div>', {'class': 'overlay transparent'}
      .css 
        'position': 'fixed'
        'top': '0'
        'bottom': '0'
        'left': '0'
        'right': '0'
        'z-index': '1'
      .appendTo 'body'
    return

  close: (el)->
    Debug.log.call @, 1, @constructor.name+' > close'
    content = el.children '.dropdown-list'
    content.animate {height: 'hide'}, @options.speed, ()=>
      el.removeClass @options.class

      if @options.overlay then @removeOverlay()
    $ 'html,body'
      .not @selector
      .off 'click', @onClickElseWhere
    return

  removeOverlay: ()->
    Debug.log.call @, 1, @constructor.name+' > removeOverlay'
    $ '.overlay.transparent'
      .remove()
    return




class CustomSelect extends DropdownMenu
  # stopEvent = (ev)->
  #   ev.stopPropagation()
  #   ev.preventDefault()

  constructor: (@selector, options)->
    super @selector, options
    @selector.on 'click', '.dropdown-list a', @onClickChoice

  onClickChoice: (click)=>
    Debug.log.call @, 1, @constructor.name+' > onClickChoice'
    stopEvent click

    target = $ click.currentTarget
    parent = target.parents()
    .filter @selector

    @changeValue target
    @setValue target
    @close parent
    parent.trigger 'DropdownMenu-change'

    return

  changeValue: (el)->
    Debug.log.call @, 1, @constructor.name+' > changeValue'
    parent = el.parents @selector

    parent.children '.dropdown-text'
    .text el.text()
    
    el.parent '.item'
    .addClass 'active'
    .siblings '.item'
    .removeClass 'active'
    return

  setValue: (el)->
    Debug.log.call @, 1, @constructor.name+' > setValue'
    value = el.data 'value' || el.text()
    parent = el.parents @selector

    parent.children 'input[type=hidden]'
    .val value
    return


global.DropdownMenu = DropdownMenu
global.CustomSelect = CustomSelect