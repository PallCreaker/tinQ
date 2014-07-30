class RemoveProductIdFromPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :product_id
  end

  def down
    remove_column :posts, :product_id, :integer, null: false
  end
end
