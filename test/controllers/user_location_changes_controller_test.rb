require 'test_helper'

class UserLocationChangesControllerTest < ActionController::TestCase
  setup do
    @user_location_change = user_location_changes(:one)
  end

  test "should get index" do
    get :index, token: 'token_1'
    assert_response :success
    assert_not_nil assigns(:user_location_changes)
  end

  test "should get new" do
    get :new, token: 'token_1'
    assert_response :success
  end

  test "should create user_location_change" do
    assert_difference('UserLocationChange.count') do
      post :create, user_location_change: {
          location_attributes: {lat: 5, lng: 3},
          user_id: @user_location_change.user_id
        }, token: 'token_1'
    end

    assert_redirected_to user_location_change_path(assigns(:user_location_change))
  end

  test "should show user_location_change" do
    get :show, id: @user_location_change, token: 'token_1'
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_location_change, token: 'token_1'
    assert_response :success
  end

  test "should update user_location_change" do
    patch :update, id: @user_location_change, user_location_change: { location_id: @user_location_change.location_id, user_id: @user_location_change.user_id }, token: 'token_1'
    assert_redirected_to user_location_change_path(assigns(:user_location_change))
  end

  test "should destroy user_location_change" do
    assert_difference('UserLocationChange.count', -1) do
      delete :destroy, id: @user_location_change, token: 'token_1'
    end

    assert_redirected_to user_location_changes_path
  end
end
