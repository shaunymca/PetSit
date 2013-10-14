class AddAccountToDefaultPrices < ActiveRecord::Migration
  def change
    add_column :default_prices, :account_id, :integer
  end
end
