class AddConceptToFinances < ActiveRecord::Migration
  def change
    add_column :finances, :concept_type, :string
  end
end
