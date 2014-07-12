class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :product_id, null: false
      t.attachment :image
    end
  end
end
