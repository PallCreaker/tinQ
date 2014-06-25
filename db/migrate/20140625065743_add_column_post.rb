class AddColumnPost < ActiveRecord::Migration
  def change
    add_column :posts , :user_id , :integer
    add_column :posts , :category_id , :integer
    add_column :posts , :item_id , :integer
  end
end
