class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name
      t.text :description
      t.integer :cache
      t.timestamps null: false
    end
  end
end
