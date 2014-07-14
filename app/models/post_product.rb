class PostProduct < ActiveRecord::Base
  belongs_to :post_id
  belongs_to :product_id

  validates :post_id, presence: true, numericality: { only_integer: true }
  validates :product_id, presence: true, numericality: { only_integer: true }
end
