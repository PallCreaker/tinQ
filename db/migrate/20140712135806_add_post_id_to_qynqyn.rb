class AddPostIdToQynqyn < ActiveRecord::Migration
  def change
    add_column :qynqyns, :post_id, :integer, null: false
  end
end
