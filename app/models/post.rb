class Post < ActiveRecord::Base
  belongs_to :users
  scope :latest ,order('update_at desc')

  has_one :qynqyn
  has_many :products
  has_and_belongs_to_many :categorys
end
