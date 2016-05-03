json.events @events.where(completed: true) do |event|
json.id event.id
json.date event.date
json.price event.price
json.event_type event.event_type
json.band @band, :name, :cache, :comission
venue = Venue.find_by id: event.venue_id
json.venue venue, :name, :cache, :address, :city

  json.receive event.finances.where(concept_type:'Receive') do |receive|
    json.id receive.id
    json.concept receive.concept
    json.amount receive.amount
  end
  json.expense event.finances.where(concept_type:'Expense') do |expense|
    json.id expense.id
    json.concept expense.concept
    json.amount expense.amount
  end
end
