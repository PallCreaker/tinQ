class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :goods_name
      t.integer :brand_id

      t.timestamps
    end
  end
end
