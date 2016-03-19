class ReportEvent < ActiveRecord::Migration
  def change
  	add_reference :reports, :event, index: true
  	remove_column :reports, :event_id_id
  end
end
