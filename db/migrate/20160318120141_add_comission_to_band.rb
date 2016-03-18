class AddComissionToBand < ActiveRecord::Migration
  def change
  	add_column :bands, :comission, :integer
  end
end
