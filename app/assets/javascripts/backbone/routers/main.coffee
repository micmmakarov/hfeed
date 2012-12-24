class App.Routers.main extends Backbone.Router

  initialize: ->
    @on "all", @storeRoute
    @history = []
    $("html").on "click", ".link", (event) ->
      event.preventDefault()
      path = @getAttribute('href')
      if @getAttribute('data-page') == 'home'
        App.router.navigate '', {trigger:true}
      else
        App.router.navigate path, {trigger:true}

    @articles = new App.Collections.Articles()
    @articles.fetch()


  routes:
    '_=_'         : 'index'
    ''            : 'index'
    'new'         : 'new'
    'about'       : 'about'

  index: ->
    @view = new App.Views.Articles({el:"#content", articles:@articles})
    @view.render()

  new: ->
    @view = new App.Views.newArticle({articles:@articles})
    $(".modal-holder").html @view.render().el
    $('.overlay').fadeIn 'fast'
    $('body').css 'overflow','hidden'

  about: ->
    @view = new App.Views.StaticView({el:"#content", page:'about'})
    @view.render()


  storeRoute: ->
    current_url = Backbone.history.fragment
    @history.push current_url
    @highlight_links(current_url)

  previous: ->
    if @history.length > 1
      @navigate @history[@history.length-2], false
    else
      @navigate '', true

  highlight_links: (current_url) ->
    current_url = 'home' if current_url == ''
    $("a[href!='/#{current_url}']").parent().removeClass('active')
    $("a[href='/#{current_url}']").parent().addClass('active')
