require 'rails_helper'

RSpec.describe "product_images/show", :type => :view do
  before(:each) do
    @product_image = assign(:product_image, ProductImage.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
