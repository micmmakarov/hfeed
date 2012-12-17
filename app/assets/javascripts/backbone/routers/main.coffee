class App.Routers.main extends Backbone.Router

  initialize: ->
    @on "all", @storeRoute
    @history = []
    $("html").on "click", ".link", (event) ->
      event.preventDefault()
      if @getAttribute('data-page') == 'home'
        App.router.navigate @getAttribute(''), {trigger:true}
      else
        App.router.navigate @getAttribute('href'), {trigger:true}

    @articles = new App.Collections.Articles()
    @articles.fetch()


  routes:
    ''            : 'index'
    'new'         : 'new'

  index: ->
    @view = new App.Views.Articles({el:"#content", articles:@articles})
    @view.render()

  new: ->
    @view = new App.Views.newArticle({articles:@articles})
    $(".modal-holder").html @view.render().el
    $('.overlay').fadeIn 'fast'
    $('body').css 'overflow','hidden'

  storeRoute: ->
    @history.push Backbone.history.fragment

  previous: ->
    if @history.length > 1
      @navigate @history[@history.length-2], false
    else
      @navigate '', true