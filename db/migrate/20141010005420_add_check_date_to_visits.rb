class AddCheckDateToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :checkin_date, :datetime
  end
end
