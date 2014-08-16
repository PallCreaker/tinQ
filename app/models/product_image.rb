class ProductImage < ActiveRecord::Base
  belongs_to :product
  
  validates :product_id, presence: true, numericality: { only_integer: true }
end
