TicketExample.Views.Tickets ||= {}

class TicketExample.Views.Tickets.NewView extends Backbone.View
  template: JST["backbone/templates/tickets/new"]

  events:
    "submit #new-ticket": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (ticket) =>
        @model = ticket
        window.location.hash = "#/index"

      error: (ticket, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
