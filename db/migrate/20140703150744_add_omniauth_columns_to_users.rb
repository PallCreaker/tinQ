class AddOmniauthColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :uid,      :string, null: false, default: ""
    add_column :users, :provider, :string, null: false, default: ""
    add_column :users, :tw_name,     :string

    add_index :users, [:uid, :provider], unique: true
  end
end
