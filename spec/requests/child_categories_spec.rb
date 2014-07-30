require 'rails_helper'

RSpec.describe "ChildCategories", :type => :request do
  describe "GET /child_categories" do
    it "works! (now write some real specs)" do
      get child_categories_path
      expect(response.status).to be(200)
    end
  end
end
