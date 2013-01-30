class AddCustomdefaultToClientPrices < ActiveRecord::Migration
  def change
    change_column :client_prices, :custom, :boolean, :default => true
  end
end
