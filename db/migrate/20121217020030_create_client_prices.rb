class CreateClientPrices < ActiveRecord::Migration
  def change
    create_table :client_prices do |t|
      t.decimal :price
      t.string :visit_type
      t.integer :client_id

      t.timestamps
    end
  end
end
