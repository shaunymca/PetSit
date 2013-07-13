class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :client_id
      t.datetime :due_date
      t.boolean :paid
      t.integer :user_id

      t.timestamps
    end
  end
end
