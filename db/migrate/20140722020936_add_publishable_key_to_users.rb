class AddPublishableKeyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :publishable_key, :string
  end
end
