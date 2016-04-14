class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :email
      t.string :phone
      t.integer :cache
      t.string :contact_name
      t.timestamps null: false
    end
  end
end
