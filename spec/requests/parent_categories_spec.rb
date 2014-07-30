require 'rails_helper'

RSpec.describe "ParentCategories", :type => :request do
  describe "GET /parent_categories" do
    it "works! (now write some real specs)" do
      get parent_categories_path
      expect(response.status).to be(200)
    end
  end
end
