class App.Collections.Articles extends Backbone.Collection

  model: App.Models.Article

  url: '/api/articles'

  initialize: ->
  comparator: (article) ->
    -article.get "score"
