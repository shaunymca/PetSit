class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :client_id
      t.text :visit_type
      t.integer :visit_price
      t.datetime :visit_date
      t.integer :invoice_id

      t.timestamps
    end
  end
end
