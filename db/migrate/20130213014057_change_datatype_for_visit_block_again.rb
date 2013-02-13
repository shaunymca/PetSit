class ChangeDatatypeForVisitBlockAgain < ActiveRecord::Migration
  def self.up
    change_table :visit_blocks do |t|
      t.change :thursday, :boolean
      t.change :friday, :boolean
      t.change :saturday, :boolean
      t.change :sunday, :boolean
    end
  end
  def self.down
    change_table :visit_blocks do |t|
      t.change :thursday, :text
      t.change :friday, :text
      t.change :saturday, :text
      t.change :sunday, :text
    end
  end
end
