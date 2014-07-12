class Product < ActiveRecord::Base
  belongs_to :brand
  has_many :posts
  has_many :images

  validates :brand_id, presence: true, numericality: { only_integer: true }
  validates :goods_name, presence: { message: 'なにか入力して下さい'}
end
