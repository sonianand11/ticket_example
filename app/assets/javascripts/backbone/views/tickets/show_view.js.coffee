TicketExample.Views.Tickets ||= {}

class TicketExample.Views.Tickets.ShowView extends Backbone.View
  template: JST["backbone/templates/tickets/show"]

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
