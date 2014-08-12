class Post < ActiveRecord::Base
  belongs_to :user
  has_one :qynqyn
  has_many :post_products
  has_many :products, through: :post_products

  default_scope { where('is_deleted != 1')}
  scope :latest, -> { order('update_at desc') }

  mount_uploader :image, ImageUploader
  accepts_nested_attributes_for :post_products

  validates :content, presence: { message: '必須です。'}
  validates :user_id, presence: true, numericality: { only_integer: true }
end
