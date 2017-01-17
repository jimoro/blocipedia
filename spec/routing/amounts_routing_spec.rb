require "rails_helper"

RSpec.describe AmountsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/amounts").to route_to("amounts#index")
    end

    it "routes to #new" do
      expect(:get => "/amounts/new").to route_to("amounts#new")
    end

    it "routes to #show" do
      expect(:get => "/amounts/1").to route_to("amounts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/amounts/1/edit").to route_to("amounts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/amounts").to route_to("amounts#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/amounts/1").to route_to("amounts#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/amounts/1").to route_to("amounts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/amounts/1").to route_to("amounts#destroy", :id => "1")
    end

  end
end
