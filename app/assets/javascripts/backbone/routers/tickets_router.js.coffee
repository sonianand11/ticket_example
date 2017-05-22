class TicketExample.Routers.TicketsRouter extends Backbone.Router
  initialize: (options) ->
    @tickets = new TicketExample.Collections.TicketsCollection()
    #@tickets.reset options.tickets

  routes:
    "report"   : "report"
    "new"      : "newTicket"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  report: ->
    @report = new TicketExample.Collections.TicketsCollection()
    @report.url = "/api/v1/tickets/report"
    @report.fetch({reset: true})
    @view = new TicketExample.Views.Tickets.ReportView(collection: @report)
    $("#tickets").html(@view.render().el)

  newTicket: ->
    @view = new TicketExample.Views.Tickets.NewView(collection: @tickets)
    $("#tickets").html(@view.render().el)

  index: ->
    @tickets.fetch({reset: true})
    @view = new TicketExample.Views.Tickets.IndexView(collection: @tickets)
    $("#tickets").html(@view.render().el)

  show: (id) ->
    ticket = @tickets.get(id)

    @view = new TicketExample.Views.Tickets.ShowView(model: ticket)
    $("#tickets").html(@view.render().el)

  edit: (id) ->
    ticket = @tickets.get(id)

    @view = new TicketExample.Views.Tickets.EditView(model: ticket)
    $("#tickets").html(@view.render().el)
