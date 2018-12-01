require 'rails_helper'

RSpec.describe "DogWalkings", type: :request do
  describe "GET /dog_walkings" do
    it "works! (now write some real specs)" do
      get api_v1_dog_walkings_path
      expect(response).to have_http_status(200)
    end
  end
end
