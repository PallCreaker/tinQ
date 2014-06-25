require "rails_helper"

RSpec.describe QynqynsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/qynqyns").to route_to("qynqyns#index")
    end

    it "routes to #new" do
      expect(:get => "/qynqyns/new").to route_to("qynqyns#new")
    end

    it "routes to #show" do
      expect(:get => "/qynqyns/1").to route_to("qynqyns#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/qynqyns/1/edit").to route_to("qynqyns#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/qynqyns").to route_to("qynqyns#create")
    end

    it "routes to #update" do
      expect(:put => "/qynqyns/1").to route_to("qynqyns#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/qynqyns/1").to route_to("qynqyns#destroy", :id => "1")
    end

  end
end
