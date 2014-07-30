class AddChildCategoryIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :child_category_id, :integer, null: false
  end
end
