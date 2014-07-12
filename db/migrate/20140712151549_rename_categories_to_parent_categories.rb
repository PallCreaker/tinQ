class RenameCategoriesToParentCategories < ActiveRecord::Migration
  def change
    rename_table :categories, :parent_categories
  end
end
