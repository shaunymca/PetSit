class AddDefaultPriceIdToClientPrice < ActiveRecord::Migration
  def change
    add_column :client_prices, :default_price_id, :integer
  end
end
