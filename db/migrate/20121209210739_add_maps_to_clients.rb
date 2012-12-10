class AddMapsToClients < ActiveRecord::Migration
  def change
    add_column :clients, :latitude, :float
    add_column :clients, :longitude, :float
    add_column :clients, :gmaps, :boolean
  end
end
