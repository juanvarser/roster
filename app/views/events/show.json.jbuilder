json.id @event.id
json.date @event.date
json.completed @event.completed
json.price @event.price
json.event_type @event.event_type
json.band @band, :name, :cache, :comission
json.venue @venue, :name, :cache, :address, :city

  json.receive @event.finances.where(concept_type:'Receive') do |receive|
    json.id receive.id
    json.concept receive.concept
    json.amount receive.amount
  end
  json.expense @event.finances.where(concept_type:'Expense') do |expense|
    json.id expense.id
    json.concept expense.concept
    json.amount expense.amount
  end
