class AddBandReferenceToProduct < ActiveRecord::Migration
  def change
  	add_reference :products, :band, index: true
  end
end
