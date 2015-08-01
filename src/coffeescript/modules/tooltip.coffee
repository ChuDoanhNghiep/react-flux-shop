Tip = require "component-tip"

class Tooltip
  "use strict"

  defaults =
    debug: 0
    targets: '[data-tip]'
    events : 'mouseenter mouseleave touchstart'
    onTipShow: ()->
      return
    onTipHide: ()->
      return

  stopEvent = (ev)->
    ev.stopPropagation()
    ev.preventDefault()

  constructor: (@selector, options)->
    @options = $.extend true, {}, defaults, options
    Debug.log.call @, 1, @constructor.name+' > constructor'
    Debug.log.call @, 2, @constructor.name+' >> options', @options

    @events = @options.events.split ' ' || []
    @selector.find @options.targets
    .each @setup
    
  setup: (idx, el)=>
    Debug.log.call @, 1, @constructor.name+' > setup'
    $el = $ el
    content = $el.children('.tooltip').html() || $el.data 'tip'
    position = $el.data('tip-position') || 'right'
    effect = $el.data 'tip-effect'
    Debug.log.call @, 2, @constructor.name+' >> tip options', {'position': position, 'effect': effect}

    tip = new Tip(content)
    tip.position(position)
    if effect then tip.effect(effect)

    tip
    .on 'show', @options.onTipShow
    .on 'hide', @options.onTipHide
    
    for ev in @events
      if ev == 'load'
        @onLoad tip,el
      else if ev[0..5] == 'custom' # custom Events
        selector = @options[ev].selector
        type = @options[ev].type || ev
        func = 'on'+type[0..0].toUpperCase()+type[1..]
        selector.on type, {'tip': tip, 'el': el}, @options[ev][func]
      else
        func = 'on'+ev[0..0].toUpperCase()+ev[1..]
        $el.on ev, {'tip': tip, 'el': el}, @[func]

    # add behaviour for the tip object 
    @options.setup(idx, tip, el) if @options.setup

  onMouseenter: (ev)=>
    Debug.log.call @, 1, @constructor.name+' > onMouseenter'
    ev.data.tip.show(ev.data.el) unless @selector.find(@options.targets).hasClass('tip-disabled')

    $el = $ ev.data.el
    $el.addClass 'active'

  onMouseleave: (ev)=>
    Debug.log.call @, 1, @constructor.name+' > onMouseleave'
    ev.data.tip.hide()

    $el = $ ev.data.el
    $el.removeClass 'active'    

  onClick: (ev)=>
    Debug.log.call @, 1, @constructor.name+' > onClick'

    stopEvent ev
    $el = $ ev.data.el

    if !$el.hasClass 'active'
      ev.data.tip.show(ev.data.el)
      $el.addClass 'active'
    else
      ev.data.tip.hide()
      $el.removeClass 'active'

  onAddClick: (ev)=>
    Debug.log.call @, 1, @constructor.name+' > onCustomClick'
    # $el = $ ev.data.el

    # if !$el.hasClass 'active'
    #   ev.data.tip.show(ev.data.el)
    #   $el.addClass 'active'
    # else
    #   ev.data.tip.hide()
    #   $el.removeClass 'active'
    @onClick(ev)

  onTouchstart: (ev)=>
    @onClick(ev)

  onLoad: (tip, el)=>
    Debug.log.call @, 1, @constructor.name+' > onLoad'
    tip.show(el)

  kill: ()=>
    Debug.log.call @, 1, @constructor.name+' > kill'
    for ev in @events
      if ev[0..5] == 'custom' # custom Events
        selector = @options[ev].selector
        type = @options[ev].type || ev
        func = 'on'+type[0..0].toUpperCase()+type[1..]
        selector.off type
      else
        func = 'on'+ev[0..0].toUpperCase()+ev[1..]
        $el.off ev

# override Tip prototype function show as we need to disable scroll
# event handler
Tip.prototype.show = (el) ->
  events = require "component-events"
  if ('string' == typeof el) 
    el = query(el)

 
  this.target = el
  document.body.appendChild(this.el)
  this.classes.add('tip-' + this._position.replace(/\s+/g, '-'))
  this.classes.remove('tip-hide')

  if ('number' == typeof el) 
    x = arguments[0]
    y = arguments[1]
    console.log y
    this.emit('show')
    css(this.el, {
      top: y,
      left: x
    })
    return this
  

  this.reposition()
  this.emit('show', this.target)

  if !this.winEvents
    this.winEvents = events(window, this)
    this.winEvents.bind('resize', 'reposition')
    # this.winEvents.bind('scroll', 'reposition')
  

  return this


# override if the suggested position in Tip
Tip.prototype.suggested = (pos, offset)->
  el = this.el

  ew = el.clientWidth
  eh = el.clientHeight
  top = if window.pageYOffset then window.pageYOffset else document.documentElement.scrollTop
  left = if window.pageXOffset then window.pageXOffset else document.documentElement.scrollLeft
  w = if window.innerWidth then window.innerWidth else document.documentElement.clientWidth
  h = if window.innerHeight then window.innerHeight else document.documentElement.clientHeight

  newPos = pos
  
  testTop = ()->
    return offset.top + eh > top + h

  testBottom = ()->
    return offset.top < top

  testLeft = ()->
    return offset.left + ew > left + w

  testRight = ()->
    return offset.left < left

  testPos = ()->
    needReposition = false
    # too low
    if (testTop()) 
      needReposition = true
      newPos = 'bottom' # 'top'

    # too high
    else if (testBottom()) 
      needReposition = true
      newPos = 'top'  # 'bottom'

    # too far to the right
    else if (testLeft()) 
      needReposition = true
      newPos = 'left'

    # too far to the left
    else if (testRight()) 
      needReposition = true
      newPos = 'right'

    return needReposition
  
  positions = (()->
    positions = ['left', 'right', 'top', 'bottom']
    idPosition = ((array, value)->
      for val,id in array
        if value == val
          return id
    )(positions, pos)

    positions.splice idPosition, 1
    positions.unshift pos
    return positions
  )()

  for i in positions
    offset = this.offset i
    needReposition = testPos()
    newPos = i
    if !needReposition
      break

  if newPos is 'bottom' and offset.left < 0
    newPos = 'bottom right'

  return newPos

global.Tooltip = Tooltip