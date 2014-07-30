class ProductImage < ActiveRecord::Base
  belongs_to :product
  has_attached_file :image,
    storage: :s3,
    s3_credentials: "#{Rails.root}/config/s3.yml",
    url: "s3_domain_url",
    path: ":attachment/:id/:updated_at.:extension"
  validates_attachment_content_type :image,
    content_type: { content_type: ["image/jpg", "image/png","image/jpeg", "image/gif"] },
    size: { less_than: 3.megabytes }

  validates :product_id, presence: true, numericality: { only_integer: true }
end
