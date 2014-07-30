class CreateChildCategories < ActiveRecord::Migration
  def change
    create_table :child_categories do |t|
      t.integer :parent_category_id, null: false

      t.timestamps
    end
  end
end
