class Raffler.Views.Entry extends Backbone.View

  template: HandlebarsTemplates['entries/entry']
  tagName: 'li'

  events:
    'click .show_entry': 'showEntry'
    'click .delete': 'deleteEntry'

  initialize: ->
    @model.on('change', @render, this)
    @model.on('highlight', @highlightWinner, this)
    @model.on('destroy', @removeEntry, this)

  showEntry: ->
    Backbone.history.navigate("entries/#{@model.get('id')}", true)

  highlightWinner: ->
    $('.winner').removeClass('highlight')
    @$('.winner').addClass('highlight')

  render: ->
    $(@el).html(@template(@model.toJSON()))
    this

  deleteEntry: ->
    event.preventDefault()
    @model.destroy
      success: (model, response) ->

  removeEntry: ->
    $(@el).remove()
