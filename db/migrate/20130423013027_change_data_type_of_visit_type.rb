class ChangeDataTypeOfVisitType < ActiveRecord::Migration
  change_column :visits, :visit_type, :string
end
