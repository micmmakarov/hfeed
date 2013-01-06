class App.Views.Comment extends Backbone.View
  className: 'comment'

  initialize: (options) ->
    @model.on 'change', @render, @
    @model.on 'destroy', @destroyView, @

  events:
    'click .remove': 'destroyComment'

  destroyComment: ->
    @model.destroy()
    false

  destroyView: ->
    @unbind()
    @remove()

  render: ->
    data = @model.toJSON()
    data['date'] = moment(data.created_at).startOf('hour').fromNow()
    if App.current_user
      data['destroyable'] = true if data.user_id == App.current_user.id
    else
      data['destroyable'] = false
    @$el.html HandlebarsTemplates['comment'](data)
    @