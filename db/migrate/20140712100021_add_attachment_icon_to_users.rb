class AddAttachmentIconToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :icon
    end
  end

  def self.down
    drop_attached_file :users, :icon
  end
end
