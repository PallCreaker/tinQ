require "rails_helper"

RSpec.describe ParentCategoriesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/parent_categories").to route_to("parent_categories#index")
    end

    it "routes to #new" do
      expect(:get => "/parent_categories/new").to route_to("parent_categories#new")
    end

    it "routes to #show" do
      expect(:get => "/parent_categories/1").to route_to("parent_categories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/parent_categories/1/edit").to route_to("parent_categories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/parent_categories").to route_to("parent_categories#create")
    end

    it "routes to #update" do
      expect(:put => "/parent_categories/1").to route_to("parent_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/parent_categories/1").to route_to("parent_categories#destroy", :id => "1")
    end

  end
end
