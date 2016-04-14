class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :price
      t.date :date
      t.time :time
      t.timestamps null: false
    end
  end
end
