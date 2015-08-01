class RefineMenu
  defaults=
    class: 'selected'
    cb: ()->
      return
    debug: 0
    targets: 'input[type=checkbox]'

  constructor: (@selector, options)->
    @options = $.extend true, {}, defaults, options
    Debug.log.call @, 1, @constructor.name+' > constructor'
    
    @selector.on 'change', @options.targets, @onChange
    @selector.on 'click', '.clear-selection', @clearAll
    @selector.on 'keyup', '.searchbox input', @onKeyUp
    @selector.on 'click', '.clear-selection-all', @clearAllFilters

  onChange: (click)=>
    stopEvent click
    Debug.log.call @, 1, @constructor.name+' > onChange'
    @toggleFilter click.currentTarget
    return

  onKeyUp: (key)=>
    Debug.log.call @, 1, @constructor.name+' > onKeyUp'
    target = key.currentTarget
    Debug.log.call @, 2, @constructor.name+' >> value = ', target.value
    category = $ target
      .closest '.submenu'

    entries = @getCategoryEntries category
    matches = @getMatchedEntries entries, target.value
    
    @hideFilter entries
    @showFilter matches

    return

  getCategoryEntries: (category)->
    return category.find(@options.targets).closest('label')

  getMatchedEntries: (entries, value)->
    return entries.filter ()->
      text = $ this
        .text().trim()
      return -1 != RefineMenu.prototype.matchInputValue(value, text)


  matchInputValue: (input, text)->
    text = text.toLowerCase()
    input = input.toLowerCase().trim()
    return text.indexOf(input)


  toggleFilter: (el)->
    Debug.log.call @, 1, @constructor.name+' > toggleFilter'
    Debug.log.call @, 2, @constructor.name+' >> element = ', el

    if el.checked then @addFilter(el) else @rmFilter(el)
    return

  addFilter: (el)->
    name = $(el).parent().text()
    Debug.log.call @, 1, @constructor.name+' > addFilter'
    Debug.log.call @, 2, @constructor.name+' >> name = ', name

    selectedDisplay = $ '.selectedFilters>.content'
    closeBtn = $ '<span>', 
      'class': 'close'
    .text '×'

    @showFilterDisplay selectedDisplay
    $ '<div>', {'class' : 'title selectedFilter'}
      .text(name)
      .attr('data-target', el.id)
      .append(closeBtn)
      .hide()
      .appendTo(selectedDisplay)
      .on 'click', '.close', (click)->
        stopEvent click
        el.checked = false
        $el = $ el
        if $el.hasClass 'cfe-styled'
          $el.trigger 'mousedown.cfe'
            .trigger 'change'
      # .slideDown()
      .animate
        opacity : 'show'
        height : 'show'
        paddingTop: 'show'
        paddingBottom: 'show'
    return

  rmFilter: (el)->
    filter = $ '[data-target='+el.id+']'
    Debug.log.call @, 1, @constructor.name+' > rmFilter'
    Debug.log.call @, 2, @constructor.name+' >> filter = ', filter

    filter.off 'click', '.close'
    .animate {opacity : 'hide', height : 'hide', paddingTop: 'hide', paddingBottom: 'hide'}, ()->
      $ this
        .remove()
    
    return

  showFilterDisplay: (el)->
    if el.css('display') == 'none' 
      el.css 'display', 'block'
    return

  clearAll: (click)=>
    Debug.log.call @, 1, @constructor.name+' > clearAll'
    stopEvent click
    filters= $ click.currentTarget
      .parents '.filters'
      
    filters.find @options.targets
      .filter ':checked'
      .prop 'checked', false
      .trigger 'mousedown.cfe'
      .trigger 'change'

    return

  clearAllFilters: (click)=>
    Debug.log.call @, 1, @constructor.name+' > clearAllFilters'
    stopEvent click
    @selector.find('.clear-selection').trigger 'click'
    


  hideFilter : (el)->
    el.css 'display', 'none'
    return

  showFilter : (el)->
    el.css 'display', ''
    return

global.RefineMenu = RefineMenu