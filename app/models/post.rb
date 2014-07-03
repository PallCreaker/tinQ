class Post < ActiveRecord::Base
  belongs_to :user
  scope :latest ,order('update_at desc')

  has_one :qynqyn
  belongs_to :product
  belongs_to :category
end
