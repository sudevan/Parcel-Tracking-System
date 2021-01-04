require "application_system_test_case"

class ParcelRoutesTest < ApplicationSystemTestCase
  setup do
    @parcel_route = parcel_routes(:one)
  end

  test "visiting the index" do
    visit parcel_routes_url
    assert_selector "h1", text: "Parcel Routes"
  end

  test "creating a Parcel route" do
    visit parcel_routes_url
    click_on "New Parcel Route"

    fill_in "City 1", with: @parcel_route.city_1
    fill_in "City 2", with: @parcel_route.city_2
    fill_in "Route", with: @parcel_route.route_id
    click_on "Create Parcel route"

    assert_text "Parcel route was successfully created"
    click_on "Back"
  end

  test "updating a Parcel route" do
    visit parcel_routes_url
    click_on "Edit", match: :first

    fill_in "City 1", with: @parcel_route.city_1
    fill_in "City 2", with: @parcel_route.city_2
    fill_in "Route", with: @parcel_route.route_id
    click_on "Update Parcel route"

    assert_text "Parcel route was successfully updated"
    click_on "Back"
  end

  test "destroying a Parcel route" do
    visit parcel_routes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Parcel route was successfully destroyed"
  end
end
