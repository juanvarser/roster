class SetDefaultToCompletedEventsColumn < ActiveRecord::Migration
  def change
  	change_column :events, :completed, :boolean, :default => false
  end
end
