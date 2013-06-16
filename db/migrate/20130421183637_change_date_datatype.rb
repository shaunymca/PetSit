class ChangeDateDatatype < ActiveRecord::Migration
  change_column :visit_blocks, :visit_date_start, :datetime
  change_column :visit_blocks, :visit_date_end, :datetime
end
