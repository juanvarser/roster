class AddPosterToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :poster_image, :string
  end
end
