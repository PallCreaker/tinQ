class Qynqyn < ActiveRecord::Base
  has_one :post
  validates :post_id, presence: true, numericality: { only_integer: true }
end
