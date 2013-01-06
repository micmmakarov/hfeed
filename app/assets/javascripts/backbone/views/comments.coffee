class App.Views.Comments extends Backbone.View
  #className: "comments"

  initialize: (options) ->
    @article = options.article
    @comments = options.article.comments
    @comments.fetch()
    @comments.on 'reset', @render, @
    @comments.on 'add', @addOne, @

  events:
    'submit .new-comment-form': 'newComment'

  newComment: ->
    new_comment_field = $('.new-comment')
    comment = new_comment_field.val()
    new_comment_field.val("")
    @comments.create(text:comment, article_id:@article.get('id'))
    false

  addOne: (comment) ->
    view = new App.Views.Comment(model: comment)
    @$el.find(".comments").prepend view.render().el

  render: ->
    @$el.html HandlebarsTemplates['comments']
    @$el.prepend HandlebarsTemplates['new_comment'] if App.current_user
    @comments.each(@addOne, @)
    @