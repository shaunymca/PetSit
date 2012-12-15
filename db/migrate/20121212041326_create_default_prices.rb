class CreateDefaultPrices < ActiveRecord::Migration
  def change
    create_table :default_prices do |t|
      t.integer :user_id
      t.string :visit_type
      t.decimal :price

      t.timestamps
    end
  end
end
