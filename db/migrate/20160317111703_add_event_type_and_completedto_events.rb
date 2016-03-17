class AddEventTypeAndCompletedtoEvents < ActiveRecord::Migration
  def change
  	add_column :events, :event_type, :string
  	add_column :events, :completed, :boolean
  end
end
