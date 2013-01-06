class App.Models.Article extends Backbone.Model

  initialize: ->
    comments_json = (@get 'comments') || []
    @comments = new App.Collections.Comments
    @comments.url = "/api/articles/#{@id}/comments"

  addScore: ->
    $.ajax
      type: "POST"
      url: "/api/articles/#{@id}/add_score"
      success: (data) =>
        @set('score', data.score)
