class App.Views.Article extends Backbone.View
  className: 'article'
  initialize: (options) ->
    @index = options.index
    @model.on 'change', @render, @
    @comments_shown = false
    @comments = {}

  events:
    'click .add_score': 'add_score'
    'click .comments-toggle': 'comments_toggle'

  add_score: (e) ->
    e.preventDefault()
    @model.addScore()

  comments_toggle: ->
    @comments_shown = !@comments_shown

    @$el.find(".comments-toggle").html HandlebarsTemplates['comments_toggle'](@comments_shown)

    if @comments_shown
      @comments = new App.Views.Comments(article: @model)
      @$el.find(".comments-area").html @comments.render().el
    else
      @comments.unbind()
      @comments.remove()
    false

  render: ->
    data = @model.toJSON()
    data['index'] = @index
    data['date'] = moment(data.created_at).startOf('hour').fromNow()
    @$el.html HandlebarsTemplates['article'](data)
    @$el.find(".comments-toggle").html HandlebarsTemplates['comments_toggle'](@comments_shown)
    if @comments_shown
      @comments = new App.Views.Comments(article: @model)
      @$el.find(".comments-area").html @comments.render().el

    @