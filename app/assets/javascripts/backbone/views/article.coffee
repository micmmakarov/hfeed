class App.Views.Article extends Backbone.View
  className: 'article'
  initialize: (options) ->
    @index = options.index
    @model.on 'change', @render, @

  events:
    'click .add_score': 'add_score'

  add_score: (e) ->
    e.preventDefault()
    @model.addScore()

  render: ->
    data = @model.toJSON()
    data['index'] = @index
    @$el.html HandlebarsTemplates['article'](data)
    @