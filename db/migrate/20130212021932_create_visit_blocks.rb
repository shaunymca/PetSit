class CreateVisitBlocks < ActiveRecord::Migration
  def change
    create_table :visit_blocks do |t|
      t.string :visit_type
      t.integer :visit_price
      t.datetime :visit_date_start
      t.datetime :visit_date_end
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.string :thursday
      t.string :friday
      t.string :saturday
      t.string :sunday

      t.timestamps
    end
  end
end
