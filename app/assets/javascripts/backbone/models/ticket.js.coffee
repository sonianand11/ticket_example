class TicketExample.Models.Ticket extends Backbone.Model
  paramRoot: 'ticket'

  defaults:
    title: null
    description: null
    status: null
    created_at: null
    updated_at: null

class TicketExample.Collections.TicketsCollection extends Backbone.Collection
  model: TicketExample.Models.Ticket
  url: '/api/v1/tickets'
