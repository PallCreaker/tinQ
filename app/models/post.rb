class Post < ActiveRecord::Base
  belongs_to :user
  scope :latest ,order('update_at desc')

  has_one :qynqyn
  belongs_to :product
  belongs_to :category

  has_attached_file :photo, :storage => :s3,
  :s3_credentials => "#{Rails.root}/config/s3.yml",
  :url => "s3_domain_url",
  :path => ":attachment/:id/:updated_at.:extension"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
