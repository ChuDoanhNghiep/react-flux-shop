class ExpandableMenu
  defaults=
    class: 'expanded'
    cb: ()->
      return
    collapseOthers: true
    debug: 0

  stopEvent = (ev)->
    ev.preventDefault()

  constructor: (@selector, options)->
    @options = $.extend true, {}, defaults, options
    Debug.log.call @, 1, @constructor.name+' > constructor'
    @selector.on 'click', '.expandable > .title', @onClickHeader
    @selector.on 'click', '.expandable .expandable-close', @onClickClose

  destructor: (el)->
    if !el?
      el = @selector
    else
      if typeof el.jquery != 'undefined'
        el = $ el
    el.off()

  onClickHeader: (click)=>
    Debug.log.call @, 1, @constructor.name+' > onClickHeader'
    stopEvent click
    @toggleContent $(click.currentTarget).parent('.expandable')

  onClickClose: (click)=>
    Debug.log.call @, 1, @constructor.name+' > onClickClose'
    stopEvent click
    @collapse $($(click.currentTarget).parents('.expandable').get(0))

  toggleContent: (el)=>
    Debug.log.call @, 1, @constructor.name+' > toggleContent'
    if @isExpanded(el) then @collapse(el) else @expand(el)
    if @options.collapseOthers then @collapseOthers(el)
    
  isExpanded: (el)->
    isExpanded = el.hasClass @options['class']
    Debug.log.call @, 2, @constructor.name+' >>isExpanded = ', isExpanded
    return isExpanded

  expand: (el)->
    options = @options
    Debug.log.call @, 1, @constructor.name+' > expand'
    Debug.log.call @, 2, @constructor.name+' >>el = ', el

    el.children '.content'
      .slideDown options.speed, ()=>
        el.addClass options['class']
        options.cb(el)

  collapse: (el)->
    options = @options
    Debug.log.call @, 1, @constructor.name+' > collapse'
    Debug.log.call @, 2, @constructor.name+' >>el = ', el

    el.children '.content'
      .slideUp @options.speed, ()->
        el.removeClass options['class']
        $ this
          .css 'display', '' # remove inline css 'display:none'
        options.cb(el)

  collapseOthers: (el)->
    others = @selector.find('.expandable').not(el)
    Debug.log.call @, 1, @constructor.name+' > collapseOthers'
    Debug.log.call @, 2, @constructor.name+' >>others = ', others

    @collapse $(other) for other in others
    return

global.Expand = ExpandableMenu