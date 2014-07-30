class PostProduct < ActiveRecord::Base
  belongs_to :post
  belongs_to :product

  validates :post_id, presence: true, numericality: { only_integer: true }
  validates :product_id, presence: true, numericality: { only_integer: true }
end
