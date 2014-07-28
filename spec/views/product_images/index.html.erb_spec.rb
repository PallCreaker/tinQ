require 'rails_helper'

RSpec.describe "product_images/index", :type => :view do
  before(:each) do
    assign(:product_images, [
      ProductImage.create!(),
      ProductImage.create!()
    ])
  end

  it "renders a list of product_images" do
    render
  end
end
