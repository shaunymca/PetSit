class AddVisitToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :visit_id, :integer
  end
end
