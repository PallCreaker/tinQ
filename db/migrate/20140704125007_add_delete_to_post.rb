class AddDeleteToPost < ActiveRecord::Migration
  def change
    add_column :posts, :is_deleted, :integer, null: false, :default => 0
  end
end
