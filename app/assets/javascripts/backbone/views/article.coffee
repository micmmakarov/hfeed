class App.Views.Article extends Backbone.View

  initialize: ->

  render: ->
    @$el.html HandlebarsTemplates['article'](@model.toJSON())
    @