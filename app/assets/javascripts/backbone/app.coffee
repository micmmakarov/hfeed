#= require_self
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./templates
#= require_tree ./views
#= require_tree ./routers

window.App =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  init: ->
    @router = new App.Routers.main()
    Backbone.history.start({pushState: true})

$ ->
  App.init()