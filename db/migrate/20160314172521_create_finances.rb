class CreateFinances < ActiveRecord::Migration
  def change
    create_table :finances do |t|
    	t.string :concept
    	t.integer :amount
      t.timestamps null: false
    end
  end
end
