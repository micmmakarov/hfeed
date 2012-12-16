class App.Collections.Articles extends Backbone.Collection

  model: App.Models.Quote

  url: '/api/articles'

  initialize: ->
