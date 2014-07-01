class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content
      t.integer :user_id
      t.integer :category_id
      t.integer :product_id

      t.timestamps
    end
  end
end
