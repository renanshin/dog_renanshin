require 'rails_helper'

RSpec.describe DogWalking, type: :model do
   it "is valid with valid attributes" do
    expect(DogWalking.new).to be_valid
  end
end


# datetime = DateTime.new(2016,3,12)
