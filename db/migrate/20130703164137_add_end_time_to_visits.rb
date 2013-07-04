class AddEndTimeToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :end_time, :datetime
  end
end
