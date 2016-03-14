class AddImageToBands < ActiveRecord::Migration
  def change
    add_column :bands, :band_image, :string
  end
end
