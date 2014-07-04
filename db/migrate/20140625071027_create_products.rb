class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :goods_name,      unique: true
      t.integer :brand_id,       null: false

      t.timestamps
    end
  end
end
