class App.Views.StaticView extends Backbone.View
  initialize: (options) ->
    @page = options.page

  render: ->
    @$el.html HandlebarsTemplates[@page]
    @