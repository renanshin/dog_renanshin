require 'test_helper'

class DogWalkingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dog_walking = dog_walkings(:one)
  end

  test "should get index" do
    get dog_walkings_url, as: :json
    assert_response :success
  end

  test "should create dog_walking" do
    assert_difference('DogWalking.count') do
      post dog_walkings_url, params: { dog_walking: { duration_minutes: @dog_walking.duration_minutes, finish_datetime: @dog_walking.finish_datetime, latitude: @dog_walking.latitude, longitude: @dog_walking.longitude, pets_number: @dog_walking.pets_number, price: @dog_walking.price, scheduled_date: @dog_walking.scheduled_date, start_datetime: @dog_walking.start_datetime, status: @dog_walking.status } }, as: :json
    end

    assert_response 201
  end

  test "should show dog_walking" do
    get dog_walking_url(@dog_walking), as: :json
    assert_response :success
  end

  test "should update dog_walking" do
    patch dog_walking_url(@dog_walking), params: { dog_walking: { duration_minutes: @dog_walking.duration_minutes, finish_datetime: @dog_walking.finish_datetime, latitude: @dog_walking.latitude, longitude: @dog_walking.longitude, pets_number: @dog_walking.pets_number, price: @dog_walking.price, scheduled_date: @dog_walking.scheduled_date, start_datetime: @dog_walking.start_datetime, status: @dog_walking.status } }, as: :json
    assert_response 200
  end

  test "should destroy dog_walking" do
    assert_difference('DogWalking.count', -1) do
      delete dog_walking_url(@dog_walking), as: :json
    end

    assert_response 204
  end
end
