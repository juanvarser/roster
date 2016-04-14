class AddReportToEvent < ActiveRecord::Migration
  def change
    add_reference :events, :report, index: true
  end
end
