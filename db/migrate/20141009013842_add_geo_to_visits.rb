class AddGeoToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :checkin_lon, :float
    add_column :visits, :checkin_lan, :float
  end
end
