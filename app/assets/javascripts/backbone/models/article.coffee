class App.Models.Quote extends Backbone.Model
  initialize: ->

  addScore: ->
    $.ajax
      type: "POST"
      url: "/api/articles/#{@id}/add_score"
      success: (data) =>
        @set('score', data.score)
