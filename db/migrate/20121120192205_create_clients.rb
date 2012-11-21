class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip
      t.integer :user_id
      t.boolean :active

      t.timestamps
    end
  end
end
