class DeletePosterImage < ActiveRecord::Migration
  def change
  	remove_column :events, :poster_image
  end
end
