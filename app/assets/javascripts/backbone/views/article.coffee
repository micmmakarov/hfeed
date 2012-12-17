class App.Views.Article extends Backbone.View
  className: 'article'
  initialize: ->
    @model.on 'change', @render, @
  events:
    'click .add_score': 'add_score'

  add_score: (e) ->
    e.preventDefault()
    @model.addScore()

  render: ->
    @$el.html HandlebarsTemplates['article'](@model.toJSON())
    @