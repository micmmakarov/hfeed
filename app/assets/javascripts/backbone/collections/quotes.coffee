class App.Collections.Quotes extends Backbone.Collection

  model: App.Models.Quote

  url: '/api/quotes'

  initialize: ->
