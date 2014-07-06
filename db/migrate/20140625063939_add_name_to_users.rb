class AddNameToUsers < ActiveRecord::Migration
  def change
#<<<<<<< HEAD
    add_column :users, :name, :string, null: false
    add_index :users, :name, unique: true
#=======
    #add_column :users, :name, :string, unique: true
#>>>>>>> 101248ac9406d10b97bf9aab5238783e64c2e11a
  end
end
