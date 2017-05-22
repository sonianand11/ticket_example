json.id ticket.id
json.title ticket.title
json.description ticket.description
json.user_id ticket.user_id
json.status_id ticket.status_id
json.created_at ticket.created_at.strftime("%d/%m/%Y")
json.updated_at ticket.updated_at.strftime("%d/%m/%Y")
json.status ticket.status.name