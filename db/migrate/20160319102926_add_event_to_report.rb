class AddEventToReport < ActiveRecord::Migration
  def change
    add_reference :reports, :event, index: true
    remove_column :events, :report_id
  end
end
