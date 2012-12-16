class App.Models.Data extends Backbone.Model

  initialize: ->
    @quotes = new App.Collections.Quotes()
    @authors = new App.Collections.Authors()
    @descriptions = new App.Collections.Descriptions()


  fetch: ->
    @quotes.fetch()
    @authors.fetch()
    @descriptions.fetch()