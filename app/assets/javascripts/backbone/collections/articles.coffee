class App.Collections.Articles extends Backbone.Collection

  model: App.Models.Quote

  url: '/api/articles'

  initialize: ->
  comparator: (article) ->
    -article.get "score"
