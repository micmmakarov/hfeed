class App.Views.newArticle extends Backbone.View
  className: 'modal-content'

  initialize: (options) ->
    @articles = options.articles


  events:
    'click .close-modal': 'close'
    'click .create-article': 'create'

  close: (e) ->
    e.stopPropagation() if e?
    $('.overlay').fadeOut 'fast'
    $('body').css('overflow','visible')
    @unbind()
    @remove()
    App.router.previous()

  create: ->
    array_data = $("form#new").serializeArray();
    data = {}
    $.each array_data, ->
      data[this.name] = this.value
    @articles.create(data)
    @close()


  render: ->
    @$el.html HandlebarsTemplates['new'](App.current_user)
    @