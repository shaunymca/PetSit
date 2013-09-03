class AddAdditionaldetailsToClients < ActiveRecord::Migration
  def change
    add_column :clients, :phone_number, :string
    add_column :clients, :cell_phone, :string
    add_column :clients, :emergency_phone, :string
    add_column :clients, :security_code, :string
    add_column :clients, :additional_notes, :text
  end
end
