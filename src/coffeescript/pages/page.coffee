do->
  root = global

  class Debug
    "use strict"
    log: (debug, message, others...)->
      console.log('Debug', debug, message, others...) if @options.debug >= debug
      return

    error: (message, others...)->
      console.error(message, others...)

  debug = new Debug()
  root.Debug = debug

  stopEvent = (ev)->
    ev.stopPropagation()
    ev.preventDefault()

  root.stopEvent = stopEvent


$ ->
  "use strict"
  accordionMenus = new Expand $('.accordion-menu')
  window.destructAccordion = (el)->
    el.removeClass 'accordion-menu'
    accordionMenus.destructor el

  menuTabs = new MenuTabs $('.fashion.menu-tabs')
  dropDown = new DropdownMenu $(".menu-dropdown")
  # customSelect = new CustomSelect $(".custom-select")
  # cf = new CustomFormElements()
  # preorderMenuTooltip = new Tooltip $('.preorder-tabs ')
  # preorderTip = new Tooltip $('.SelectLocation')

  ua = navigator.userAgent
  isIOS = if ua.match(/iPhone|iPad|iPod/i) then true else false
  isAndroid = if ua.match(/Android/i) and not ua.match(/Chrome/i) then true else false

  # detect if IE including IE 10/11
  isIE = ua.indexOf('MSIE') isnt -1 or navigator.appVersion.indexOf('Trident/') > 0

  # detect site language
  lang = $ 'html'
    .attr 'lang'

  # change header placeholder text according to site language
  searchPHText = ' Search'
  switch lang
    # when 'en' then search-text = ' Search'
    when 'zh-cn' then searchPHText = ' 搜索'
    when 'ja-jp' then searchPHText = '検索'
    else searchPHText = searchPHText


  # Open/close left menu mobile
  mobileMenu = new MobileMenu $('.mobile-left-menu')

  # Expandable menu
  expandMenu = new Expand $('.expand-menu'), {
    class: 'expanded'
    cb: ()->
      return
    collapseOthers: false
    debug: 0
  }
  
  # Location popup
  do->
    locationPopup = new Popup $(".locationPopup")
    speed = 1000
    locationLink = $ '.location .visiting'
    
    locationLink
    .on 'mouseenter', '.link', ()->
      $ this
        .parent()
        .find '.arrow, .locationPopup'
        .stop true, false
        .fadeIn speed
    .on 'mouseleave', ()->
      $ this
        .find '.arrow, .locationPopup'
        .stop true, false
        .fadeOut speed
    .find '.link'
    .magnificPopup
      type: 'inline'
      removalDelay: 500
      disableOn: 961
      callbacks:
        beforeOpen: ()->
           this.st.mainClass = this.st.el.attr('data-effect')


  do ->
    mSearchbox = $ '.register-menu .searchbox input.search_text'
    items = $ '.mobile-menu,.wishlist,.shopping-bag'
    speed = 800
    mSearchbox.on 'focus', ()->
      if isIOS
        $ '.main-header'
          .css {position:'absolute'}
        $(window).scrollTop 0

      items.fadeOut()
      mSearchbox.attr 'placeholder', searchPHText
                .css 'border-left', 'medium none'
                .addClass 'slided'
                .clearQueue()
                .animate {width: '100%'}, speed, 'linear', ()->
                  if isAndroid or isIE
                    $(this).prev('.placeholderWrap').addClass 'placeholder-focus'

    mSearchbox.on 'blur', ()->
      if isIOS
        $ '.main-header'
          .css {position:'fixed'}

      if isAndroid or isIE
        $(this).prev('.placeholderWrap').removeClass 'placeholder-focus'

      mSearchbox.attr 'placeholder', ''
                .css 'border-left', '1px solid #fff'
                .clearQueue()
                .animate {width: '0'}, speed, 'linear', ()->
                  $(this).removeClass 'slided'
                  items.fadeIn()

    if isAndroid or isIE
      mSearchbox.on 'keyup input change', ()->
        $(this).prev('.placeholderWrap')
          .toggleClass 'placeholder-changed', this.value isnt ''


    $ '.main-header .li.tab.search'
      .on 'click',(ev)->
        ev.preventDefault()
        ev.stopPropagation()
        if mSearchbox.hasClass 'slided'
          mSearchbox.blur()
        else
          mSearchbox.focus()
          
    return

  do ->
    tranPoint = 200
    # isFullpageIframe = document.getElementById 'iframePdf'
    setStickyHeader = (passTranPoint, isDesktopView)->
      if passTranPoint  
        $ 'header.main-header'
          .addClass 'sticky-header'
      else if isDesktopView
        $ '.main-header'
          .removeClass 'sticky-header'
        if stickyMenu.isOpened()
          stickyMenu.close() 

    $ window
      .scroll ()->
        st =  $(this).scrollTop() > tranPoint
        w = $(window).width() > 960
        setStickyHeader(st, w)

        # if st  
        #   $ 'header.main-header'
        #     .addClass 'sticky-header'
        # else if w
        #   $ '.main-header'
        #     .removeClass 'sticky-header'
        #   if stickyMenu.isOpened()
        #     stickyMenu.close() 

    # when it's fullpage iframe
    $ window
      .load ()->
        $ '#dfsframe'
          .contents()
          .scroll ()->
            st = $('#dfsframe').contents().find('body').scrollTop() > tranPoint
            w = $(window).width() > 960
            setStickyHeader(st, w)
            return
        return

    return

  # desktop header search box 
  do ->
    dSearchbox = $ '.desktop-searchbox input.search_text'
    speed = 800
    dSearchbox.on 'focus', ()->
      if isIOS
        $ '.main-header'
          .css {position:'absolute'}
        $(window).scrollTop 0

      dSearchbox.attr 'placeholder', searchPHText
                .addClass 'slided'
                # .clearQueue()
                .stop true,false 
                .animate {width: '160px'}, speed, 'linear', ()->
                  if isIE 
                    $(this).prev('.placeholderWrap').addClass 'placeholder-focus'

    dSearchbox.on 'blur', ()->
      if isIOS
        $ '.main-header'
          .css {position:'fixed'}

      dSearchbox.attr 'placeholder', ''
                # .clearQueue()
                .stop true,false 
                .animate {width: '0'}, speed, 'linear', ()->
                  $(this).removeClass 'slided'

      if isIE
        $(this).prev('.placeholderWrap').removeClass 'placeholder-focus'


    if isIE
      dSearchbox.on 'keyup input change', ()->
        $(this).prev('.placeholderWrap')
          .toggleClass 'placeholder-changed', this.value isnt ''


    $ '.desktop-search'
      .click (ev)->
        ev.preventDefault()
        ev.stopPropagation()
        if dSearchbox.hasClass 'slided'
          dSearchbox.blur()
        else
          dSearchbox.focus()

    return
    
  # desktop sticky menu
  stickyMenu = new StickyMenu $('#mobile-menu')

  #adjust sticky menu height whenever it opens
  do ->
    $ '[toggle="sticky-header-menu"]'
      .click (ev)->
        menuHeight = $('.menuwrap').height()
        winHeight = $(window).height()-54
        style = if $('head').find('style:last') then $('head').find('style:last') else $('<style/>').appendTo('head')
        if winHeight>menuHeight
          style.append('.sticky-menu-opened #mobile-menu{max-height:'+menuHeight+'px;}')
        else 
          style.append('.sticky-menu-opened #mobile-menu{max-height:'+winHeight+'px;}')

    return


  # close stickyMenu and mobileMenu when window resize
  do ->
    $ window
      .resize ()->
        desktopView = $(window).width() > 960
        mobileView = $(window).width() < 960
        if mobileView and stickyMenu.isOpened()
          stickyMenu.close()
        if desktopView and $('body').hasClass 'menu-left-opened'
          $('[toggle="fashion-mobile-left-menu"]').trigger 'click'


  # desktop footer
  do ->
    footerContent = $ '.footer-content'
    h = footerContent.height()
    $ '.footer-heading'
      .on 'click','.footer-left section, .footer-right .relative', (ev)->
        if footerContent.hasClass 'closed'
          scrollY = if $("body").scrollTop() then $("body").scrollTop() else $("html").scrollTop();
          footerContent.slideDown()
                        .removeClass 'closed'
          $("html,body").animate {scrollTop: scrollY + h}, 500,"linear"
        else
          footerContent.slideUp()
                        .addClass 'closed'

  # desktop mydfs list
  do ->
    mydfs = $ '#mydfs-list, .mydfsWrap .arrow'
    mydfsMenu = $ '.register-menu .logged-in'
    mydfsMenu.on 'mouseenter', '.title.text', ()->
      mydfs.stop(true, true).slideDown(500)

    mydfsMenu.on 'mouseleave', ()->
      mydfs.stop(true, true).slideUp(500)

  # close sticky menu and mydfs list by clicking on elsewhere
  do ->
    $ document
      .on 'click touchstart', (ev)->
        if $(ev.target).closest('.sticky-menu').length is 0 and $(ev.target).closest('#mobile-menu').length is 0 and stickyMenu.isOpened()
          stickyMenu.close()

        if $(ev.target).closest('.register-menu .logged-in').length is 0 and $('#mydfs-list').css('display') is 'block'
          $('.register-menu .logged-in .title.text').trigger 'click'


  do ->
    $ "input[placeholder]"
    .not ".search_text"
    .each ()->
      placeholder = $(this).attr "placeholder"
      $(this).removeAttr "placeholder"

      $(this)
      .addClass "placeholder"
      .val placeholder
      .focus ()->
        if $(this).val() is placeholder
            $(this).removeClass "placeholder"
            .val ""
      .blur ()->
        if $(this).val() is ""
            $(this).addClass "placeholder"
            .val placeholder