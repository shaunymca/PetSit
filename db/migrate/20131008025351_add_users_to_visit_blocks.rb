class AddUsersToVisitBlocks < ActiveRecord::Migration
  def change
    add_column :visit_blocks, :user_id, :integer
  end
end
