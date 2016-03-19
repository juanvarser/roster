class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
    	t.string :report_type
    	t.date :report_date
    	t.string :payload
      t.timestamps null: false
    end
  end
end
