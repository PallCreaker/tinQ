require 'rails_helper'

RSpec.describe "Brands", :type => :request do
  describe "GET /brands" do
    it "works! (now write some real specs)" do
      get brands_path
      expect(response.status).to be(200)
    end
  end
end
