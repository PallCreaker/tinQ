class Post < ActiveRecord::Base
  belongs_to :user
  has_one :qynqyn
  has_many :post_products

  default_scope { where('is_deleted != 1')}
  scope :latest, -> { order('update_at desc') }

  # validation
  has_attached_file :photo, :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :url => "s3_domain_url",
    :path => ":attachment/:id/:updated_at.:extension",
    # how to use styles >> http://www.imagemagick.org/script/command-line-processing.php#geometry
    :styles => { :medium => "400x400>", :thumb => "200x200>" }, 
    :default_url => "/images/:style/missing.png"
  validates_attachment :photo, :presence => true,
    :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png"], message: 'ファイル形式が間違っています。' },
    # file size max 3MB
    :size => { :in => 0..3072.kilobytes, message: 'ファイルが大きいです。' }

  validates :content, presence: { message: '必須です。'}
  validates :user_id, presence: true, numericality: { only_integer: true }
end
