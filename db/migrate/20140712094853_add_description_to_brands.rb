class AddDescriptionToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :description, :string, null: false, default: ""
  end
end
