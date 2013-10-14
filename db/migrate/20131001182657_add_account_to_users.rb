class AddAccountToModels < ActiveRecord::Migration

  def change
    add_column :clients, :account_id, :integer
    add_column :default_prices, :account_id, :integer
    add_column :visits, :account_id, :integer
    add_column :invoices, :account_id, :integer
  end
end
