class AddCustomToClientPrices < ActiveRecord::Migration
  def change
    add_column :client_prices, :custom, :boolean
  end
end
