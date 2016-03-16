class AddVenueToEvent < ActiveRecord::Migration
  def change
  	add_reference :venues, :event, index: true
  end
end
