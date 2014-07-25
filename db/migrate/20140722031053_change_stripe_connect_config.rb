class ChangeStripeConnectConfig < ActiveRecord::Migration
  def change
    add_column :accounts, :publishable_key, :string
    add_column :accounts, :access_token, :string
    add_column :accounts, :provider, :string
    add_column :accounts, :uid, :string

    remove_column :users, :publishable_key, :string
    remove_column :users, :access_token, :string
    remove_column :users, :provider, :string
    remove_column :users, :uid, :string
  end
end
