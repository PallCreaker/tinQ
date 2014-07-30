class AddNameToChildCategories < ActiveRecord::Migration
  def change
    add_column :child_categories, :name, :string, null: false
  end
end
