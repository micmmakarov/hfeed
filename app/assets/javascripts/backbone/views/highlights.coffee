class App.Views.Highlights extends Backbone.View
  initialize: (options) ->

    @articles = options.articles
    @articles.on 'reset', @render, @
    @articles.on 'add', @addOne, @


  addOne: (article, index) ->
    index = -1 if typeof(index) != "number"
    view = new App.Views.Highlight(model: article, index:(index+1))
    @$el.find("#articles").append view.render().el


  render: ->
    @$el.html HandlebarsTemplates['articles']
    @$el.find("#controls").html HandlebarsTemplates['controls'] if App.current_user
    @articles.each(@addOne, @)
    @