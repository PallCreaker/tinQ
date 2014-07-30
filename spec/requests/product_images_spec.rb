require 'rails_helper'

RSpec.describe "ProductImages", :type => :request do
  describe "GET /product_images" do
    it "works! (now write some real specs)" do
      get product_images_path
      expect(response.status).to be(200)
    end
  end
end
