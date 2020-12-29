require "application_system_test_case"

class ConsignmentsTest < ApplicationSystemTestCase
  setup do
    @consignment = consignments(:one)
  end

  test "visiting the index" do
    visit consignments_url
    assert_selector "h1", text: "Consignments"
  end

  test "creating a Consignment" do
    visit consignments_url
    click_on "New Consignment"

    fill_in "Destination contact", with: @consignment.destination_contact
    fill_in "Destination pin", with: @consignment.destination_pin
    fill_in "Source contact", with: @consignment.source_contact
    fill_in "Source pin", with: @consignment.source_pin
    fill_in "Status", with: @consignment.status
    fill_in "Tracking", with: @consignment.tracking_id
    fill_in "User", with: @consignment.user_id
    fill_in "Weight", with: @consignment.weight
    click_on "Create Consignment"

    assert_text "Consignment was successfully created"
    click_on "Back"
  end

  test "updating a Consignment" do
    visit consignments_url
    click_on "Edit", match: :first

    fill_in "Destination contact", with: @consignment.destination_contact
    fill_in "Destination pin", with: @consignment.destination_pin
    fill_in "Source contact", with: @consignment.source_contact
    fill_in "Source pin", with: @consignment.source_pin
    fill_in "Status", with: @consignment.status
    fill_in "Tracking", with: @consignment.tracking_id
    fill_in "User", with: @consignment.user_id
    fill_in "Weight", with: @consignment.weight
    click_on "Update Consignment"

    assert_text "Consignment was successfully updated"
    click_on "Back"
  end

  test "destroying a Consignment" do
    visit consignments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Consignment was successfully destroyed"
  end
end
