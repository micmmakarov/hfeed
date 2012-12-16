class App.Views.Home extends Backbone.View

  initialize: ->
    @data = new App.Models.Data()
    @data.quotes.on 'reset', @render, @
    @data.fetch()

  addOne: (quote) ->
    view = new App.Views.Quote(model: quote)
    $("#quotes").append view.render().el

  render: ->
    @$el.html HandlebarsTemplates['home']
    @data.quotes.each(@addOne, @)
    @