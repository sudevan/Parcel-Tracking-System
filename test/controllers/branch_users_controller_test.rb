require 'test_helper'

class BranchUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @branch_user = branch_users(:one)
  end

  test "should get index" do
    get branch_users_url
    assert_response :success
  end

  test "should get new" do
    get new_branch_user_url
    assert_response :success
  end

  test "should create branch_user" do
    assert_difference('BranchUser.count') do
      post branch_users_url, params: { branch_user: { city: @branch_user.city, email: @branch_user.email } }
    end

    assert_redirected_to branch_user_url(BranchUser.last)
  end

  test "should show branch_user" do
    get branch_user_url(@branch_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_branch_user_url(@branch_user)
    assert_response :success
  end

  test "should update branch_user" do
    patch branch_user_url(@branch_user), params: { branch_user: { city: @branch_user.city, email: @branch_user.email } }
    assert_redirected_to branch_user_url(@branch_user)
  end

  test "should destroy branch_user" do
    assert_difference('BranchUser.count', -1) do
      delete branch_user_url(@branch_user)
    end

    assert_redirected_to branch_users_url
  end
end
