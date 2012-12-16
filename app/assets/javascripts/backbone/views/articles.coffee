class App.Views.Articles extends Backbone.View

  initialize: ->
    @articles = new App.Collections.Articles()
    @articles.on 'reset', @render, @
    @articles.fetch()

  addOne: (quote) ->
    view = new App.Views.Article(model: quote)
    $("#articles").append view.render().el

  render: ->
    @$el.html HandlebarsTemplates['articles']
    @articles.each(@addOne, @)
    @