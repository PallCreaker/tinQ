class Category < ActiveRecord::Base
  has_many :posts

  validates :name, presence: { message: 'なにか入力して下さい'}
end
