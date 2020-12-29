require 'test_helper'

class ConsignmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @consignment = consignments(:one)
  end

  test "should get index" do
    get consignments_url
    assert_response :success
  end

  test "should get new" do
    get new_consignment_url
    assert_response :success
  end

  test "should create consignment" do
    assert_difference('Consignment.count') do
      post consignments_url, params: { consignment: { destination_contact: @consignment.destination_contact, destination_pin: @consignment.destination_pin, source_contact: @consignment.source_contact, source_pin: @consignment.source_pin, status: @consignment.status, tracking_id: @consignment.tracking_id, user_id: @consignment.user_id, weight: @consignment.weight } }
    end

    assert_redirected_to consignment_url(Consignment.last)
  end

  test "should show consignment" do
    get consignment_url(@consignment)
    assert_response :success
  end

  test "should get edit" do
    get edit_consignment_url(@consignment)
    assert_response :success
  end

  test "should update consignment" do
    patch consignment_url(@consignment), params: { consignment: { destination_contact: @consignment.destination_contact, destination_pin: @consignment.destination_pin, source_contact: @consignment.source_contact, source_pin: @consignment.source_pin, status: @consignment.status, tracking_id: @consignment.tracking_id, user_id: @consignment.user_id, weight: @consignment.weight } }
    assert_redirected_to consignment_url(@consignment)
  end

  test "should destroy consignment" do
    assert_difference('Consignment.count', -1) do
      delete consignment_url(@consignment)
    end

    assert_redirected_to consignments_url
  end
end
