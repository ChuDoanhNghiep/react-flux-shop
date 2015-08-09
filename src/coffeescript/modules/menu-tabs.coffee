class MenuTabs

  onDesktop = not Modernizr.touch

  tabs: null
  class:
    active: 'active'

  # stopEvent = (ev)->
  #   ev.stopPropagation()
  #   ev.preventDefault()

  constructor: (@el)->
    return if @el.__initFashionMenuTabs
    @el.__initFashionMenuTabs = true
    $el = $ @el

    $el
    # event on content
    .on 
      'mouseenter' : @onMouseEnterTabContent
      'mouseleave' : @onMouseLeaveTabContent
    , '.tab >.content'
    #event on title
    .on 
      'click' : @onClickTabTitle
      'mouseenter' : @onMouseEnterTabTitle
      'mouseleave' : @onMouseLeaveTabTitle
    , '.tab >.title'

    .on 'mouseleave', '.tab', @onMouseLeaveTab

    @tabs = $el.find '.tabs > .tab'


  onMouseEnterTabTitle: (enter)=>
    tab = $(enter.currentTarget).parent()
    tab.trigger 'openTab'
    @hideDividerAround tab
    @toggleTab tab

  onMouseLeaveTabTitle: (leave)=>
    return unless onDesktop

    tab = $(leave.currentTarget).parent()
    @showDividerAround tab
    @toggleTab tab

  onMouseEnterTabContent: (enter)=>
    tab = $(enter.currentTarget).parent()
    @hideDividerAround tab

  onMouseLeaveTabContent: (leave)=>
    return unless onDesktop

    tab = $(leave.currentTarget).parent()

    @showDividerAround tab
    $(tab).find('input').blur()

  onMouseLeaveTab: (leave)=>
    tab = $(leave.currentTarget)
    tab.trigger 'closeTab'

  onClickTabTitle: (click)=>
    if onDesktop
      # stopEvent click
      return
    stopEvent click
    title = click.currentTarget
    tab = $(title).parent()
    @toggleTab tab

  isActiveTab: (tab)->
    $(tab).hasClass @class.active

  toggleTab: (tab)->
    if @isActiveTab tab
      @deactivateTab tab
    else
      @activateTab tab

  activateTab: (tab)->
    @tabs.each (index, element)=>
      @deactivateTab element
    $(tab).addClass @class.active

  deactivateTab: (tab)->
    $(tab).removeClass @class.active

  hideDividerAround: (tab)->
    tab = $ tab
    tab.prev('.divider').length && tab.prev('.divider').hide()
    tab.next('.divider').length && tab.next('.divider').hide()

  showDividerAround: (tab)->
    tab = $ tab
    tab.prev('.divider').length && tab.prev('.divider').show()
    tab.next('.divider').length && tab.next('.divider').show()

global.MenuTabs = MenuTabs