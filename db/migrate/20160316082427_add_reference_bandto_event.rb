class AddReferenceBandtoEvent < ActiveRecord::Migration
  def change
  	add_reference :events, :band, index: true
  end
end
