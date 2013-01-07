class App.Views.Article extends Backbone.View
  className: 'article'
  initialize: (options) ->
    @index = options.index
    @model.on 'change', @render, @
    @comments = {}
    @comments_shown_init()

  comments_shown_init: ->
    @cookie_key = "article #{@model.get('id')}"
    cookie_key = @cookie_key
    if $.cookie(cookie_key)
      @comments_shown = true
    else
      @comments_shown = false


  events:
    'click .add_score': 'add_score'
    'click .comments-toggle': 'comments_toggle'

  add_score: (e) ->
    e.preventDefault()
    @model.addScore()

  comments_toggle: ->
    @comments_shown = !@comments_shown

    @$el.find(".comments-toggle .message").html HandlebarsTemplates['comments_toggle'](@comments_shown)

    if @comments_shown
      $.cookie(@cookie_key, "shown", { expires: 10000 });
      @comments = new App.Views.Comments(article: @model)
      @$el.find(".comments-area").html @comments.render().el
    else
      $.cookie(@cookie_key, null);
      @comments.unbind()
      @comments.remove()
    false

  render: ->
    data = @model.toJSON()
    data['index'] = @index
    data['date'] = moment(data.created_at).startOf('hour').fromNow()
    @$el.html HandlebarsTemplates['article'](data)
    @$el.find(".comments-toggle .message").html HandlebarsTemplates['comments_toggle'](@comments_shown)
    if @comments_shown
      @comments = new App.Views.Comments(article: @model)
      @$el.find(".comments-area").html @comments.render().el

    @