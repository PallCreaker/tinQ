class Post < ActiveRecord::Base
  belongs_to :users
  scope :latest ,order('update_at desc')

  has_one :qynqyn
  has_many :products
end
