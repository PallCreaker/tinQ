class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name, unique: true

      t.timestamps
    end
  end
end
