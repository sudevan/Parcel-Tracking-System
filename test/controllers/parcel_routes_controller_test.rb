require 'test_helper'

class ParcelRoutesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parcel_route = parcel_routes(:one)
  end

  test "should get index" do
    get parcel_routes_url
    assert_response :success
  end

  test "should get new" do
    get new_parcel_route_url
    assert_response :success
  end

  test "should create parcel_route" do
    assert_difference('ParcelRoute.count') do
      post parcel_routes_url, params: { parcel_route: { city_1: @parcel_route.city_1, city_2: @parcel_route.city_2, route_id: @parcel_route.route_id } }
    end

    assert_redirected_to parcel_route_url(ParcelRoute.last)
  end

  test "should show parcel_route" do
    get parcel_route_url(@parcel_route)
    assert_response :success
  end

  test "should get edit" do
    get edit_parcel_route_url(@parcel_route)
    assert_response :success
  end

  test "should update parcel_route" do
    patch parcel_route_url(@parcel_route), params: { parcel_route: { city_1: @parcel_route.city_1, city_2: @parcel_route.city_2, route_id: @parcel_route.route_id } }
    assert_redirected_to parcel_route_url(@parcel_route)
  end

  test "should destroy parcel_route" do
    assert_difference('ParcelRoute.count', -1) do
      delete parcel_route_url(@parcel_route)
    end

    assert_redirected_to parcel_routes_url
  end
end
