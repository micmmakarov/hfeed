class App.Routers.main extends Backbone.Router


  routes:
    ''            : 'index'

  index: ->
    @view = new App.Views.Articles({el:"#content"})