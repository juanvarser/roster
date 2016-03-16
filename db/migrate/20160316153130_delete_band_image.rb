class DeleteBandImage < ActiveRecord::Migration
  def change
  	remove_column :bands, :band_image
  end
end
