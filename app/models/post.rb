class Post < ActiveRecord::Base
  belongs_to :user
  scope :latest ,order('update_at desc')

  has_one :qynqyn
  has_many :products
  has_many :categories
end
