class App.Views.Quote extends Backbone.View

  initialize: ->

  render: ->
    @$el.html HandlebarsTemplates['quote'](@model.toJSON(), {hello:"hi"})
    @