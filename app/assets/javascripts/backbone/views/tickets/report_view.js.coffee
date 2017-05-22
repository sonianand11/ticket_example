TicketExample.Views.Tickets ||= {}

class TicketExample.Views.Tickets.ReportView extends Backbone.View
  template: JST["backbone/templates/tickets/report"]

  initialize: () ->
    @collection.bind('reset', @addAll)

  addAll: () =>
    @collection.each(@addOne)

  addOne: (ticket) =>
    view = new TicketExample.Views.Tickets.TicketView({model : ticket})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(tickets: @collection.toJSON() ))
    @addAll()

    return this
