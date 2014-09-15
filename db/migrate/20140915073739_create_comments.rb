class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string  :content, null: false
      t.integer :user_id, null: false, default: 0
      t.integer :post_id, null: false
      t.timestamps
    end
  end
end
