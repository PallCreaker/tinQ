class CreatePostProducts < ActiveRecord::Migration
  def change
    create_table :post_products do |t|
      t.integer :post_id, null: false
      t.integer :product_id, null: false

      t.timestamps
    end
  end
end
