class RemoveCategoryIdFromPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :category_id
  end

  def down
    remove_column :posts, :category_id, :integer, null: false
  end
end
