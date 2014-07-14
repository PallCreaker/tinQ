class Brand < ActiveRecord::Base
  has_many :product

  validates :name, presence: { message: 'なにか入力して下さい'}
end
