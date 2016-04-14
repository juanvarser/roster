class AddMembersToBand < ActiveRecord::Migration
  def change
    add_reference :members, :band, index: true
  end
end
