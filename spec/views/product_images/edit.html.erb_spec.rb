require 'rails_helper'

RSpec.describe "product_images/edit", :type => :view do
  before(:each) do
    @product_image = assign(:product_image, ProductImage.create!())
  end

  it "renders the edit product_image form" do
    render

    assert_select "form[action=?][method=?]", product_image_path(@product_image), "post" do
    end
  end
end
