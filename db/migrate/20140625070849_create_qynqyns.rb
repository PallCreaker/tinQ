class CreateQynqyns < ActiveRecord::Migration
  def change
    create_table :qynqyns do |t|
      t.integer :count

      t.timestamps
    end
  end
end
