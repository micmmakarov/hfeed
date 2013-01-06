class App.Collections.Comments extends Backbone.Collection

  model: App.Models.Comment

  url: '/api/comments'

  initialize: ->
  comparator: (article) ->
    -article.get "created_at"
