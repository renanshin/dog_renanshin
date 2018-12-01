module Api::V1
  require "rails_helper"

  RSpec.describe DogWalkingsController, type: :routing do
    describe "routing" do
      it "routes to #index" do
        expect(:get => "/api/v1/dog_walkings").to route_to("api/v1/dog_walkings#index")
      end

      it "routes to #show" do
        expect(:get => "/api/v1/dog_walkings/1").to route_to("api/v1/dog_walkings#show", :id => "1")
      end


      it "routes to #create" do
        expect(:post => "/api/v1/dog_walkings").to route_to("api/v1/dog_walkings#create")
      end

      it "routes to #update via PUT" do
        expect(:put => "/api/v1/dog_walkings/1").to route_to("api/v1/dog_walkings#update", :id => "1")
      end

      it "routes to #update via PATCH" do
        expect(:patch => "/api/v1/dog_walkings/1").to route_to("api/v1/dog_walkings#update", :id => "1")
      end

      it "routes to #destroy" do
        expect(:delete => "/api/v1/dog_walkings/1").to route_to("api/v1/dog_walkings#destroy", :id => "1")
      end
    end
  end
end
