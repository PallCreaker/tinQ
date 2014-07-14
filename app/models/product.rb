class Product < ActiveRecord::Base
  belongs_to :brand
  has_many :posts
  has_many :product_images
  belongs_to :child_category

  validates :brand_id, presence: true, numericality: { only_integer: true }
  validates :goods_name, presence: { message: 'なにか入力して下さい'}
  validates :child_category_id, presence: true, numericality: { only_integer: true }
end
