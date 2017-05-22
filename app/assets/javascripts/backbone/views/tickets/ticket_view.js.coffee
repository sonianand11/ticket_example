TicketExample.Views.Tickets ||= {}

class TicketExample.Views.Tickets.TicketView extends Backbone.View
  template: JST["backbone/templates/tickets/ticket"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
