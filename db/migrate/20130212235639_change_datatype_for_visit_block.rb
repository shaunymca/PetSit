class ChangeDatatypeForVisitBlock < ActiveRecord::Migration
  def self.up
    change_table :visit_blocks do |t|
      t.change :visit_date_start, :date
      t.change :visit_date_end, :date
    end
    add_column :visit_blocks, :client_id, :integer
    add_column :visit_blocks, :visit_time, :time
  end
  def self.down
    change_table :visit_blocks do |t|
      t.change :visit_date_start, :datetime
      t.change :visit_date_end, :datetime
    end
    remove_column :visit_blocks, :client_id, :integer
    remove_column :visit_blocks, :visit_time, :time
  end
end
