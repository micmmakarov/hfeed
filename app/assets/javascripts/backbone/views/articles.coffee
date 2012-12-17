class App.Views.Articles extends Backbone.View
  initialize: (options) ->

    @articles = options.articles
    @articles.on 'reset', @render, @
    @articles.on 'add', @addOne, @


  addOne: (article) ->
    view = new App.Views.Article(model: article)
    @$el.find("#articles").append view.render().el

  render: ->
    @$el.html HandlebarsTemplates['articles']
    @$el.find("#controls").html HandlebarsTemplates['controls'] if App.current_user
    @articles.each(@addOne, @)
    @