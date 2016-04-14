class AddFinanceToEvent < ActiveRecord::Migration
  def change
    add_reference :finances, :event, index: true
  end
end
