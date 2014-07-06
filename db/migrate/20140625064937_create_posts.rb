class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content
      t.integer :user_id,          null: false
      t.integer :category_id,      null: false
      t.integer :product_id,       null: false

      t.timestamps
    end
  end
end
