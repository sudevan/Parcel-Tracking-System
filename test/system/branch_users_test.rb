require "application_system_test_case"

class BranchUsersTest < ApplicationSystemTestCase
  setup do
    @branch_user = branch_users(:one)
  end

  test "visiting the index" do
    visit branch_users_url
    assert_selector "h1", text: "Branch Users"
  end

  test "creating a Branch user" do
    visit branch_users_url
    click_on "New Branch User"

    fill_in "City", with: @branch_user.city
    fill_in "Email", with: @branch_user.email
    click_on "Create Branch user"

    assert_text "Branch user was successfully created"
    click_on "Back"
  end

  test "updating a Branch user" do
    visit branch_users_url
    click_on "Edit", match: :first

    fill_in "City", with: @branch_user.city
    fill_in "Email", with: @branch_user.email
    click_on "Update Branch user"

    assert_text "Branch user was successfully updated"
    click_on "Back"
  end

  test "destroying a Branch user" do
    visit branch_users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Branch user was successfully destroyed"
  end
end
