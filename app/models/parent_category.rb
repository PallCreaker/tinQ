class ParentCategory < ActiveRecord::Base
  has_many :posts
  has_many :child_categories

  validates :name, presence: { message: 'なにか入力して下さい'}
end
