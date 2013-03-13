class AddVisitBlockIdToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :visit_block_id, :integer
  end
end
