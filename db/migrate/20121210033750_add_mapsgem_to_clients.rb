class AddMapsgemToClients < ActiveRecord::Migration
  def change
    add_column :clients, :gmaps, :boolean
  end
end
