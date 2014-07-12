class ChildCategory < ActiveRecord::Base
  belongs_to :parent_category

  validates :parent_category_id, presence: true
end
