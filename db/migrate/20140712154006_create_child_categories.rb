class CreateChildCategories < ActiveRecord::Migration
  def change
    create_table :child_categories do |t|
      t.integer :parenc_category_id, null: false

      t.timestamps
    end
  end
end
