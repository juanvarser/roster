class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :instrument
      t.string :gear
      t.boolean :special_food
      t.timestamps null: false
    end
  end
end
