class Product < ActiveRecord::Base
  belongs_to :brand
  has_many :product_images
  has_many :post_products
  has_many :posts, through: :post_products
  belongs_to :child_category

  mount_uploader :image, ImageUploader

  validates :brand_id         , presence: true, numericality: { only_integer: true }
  validates :goods_name       , presence: { message: 'なにか入力して下さい'}
  validates :child_category_id, presence: true, numericality: { only_integer: true }
end
