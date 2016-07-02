require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:user_one)

    @create_update_params = {
      first_name: @user.first_name, last_name: @user.last_name,
      phone: @user.phone, username: @user.username, password: 'testpass',
      photo_id: 1, location_id: 1, user_devices_attributes: [{hardware_uuid: 'XYZ'}]}
  end

  test "should get index" do
    get :index, token: 'token_1'
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new, token: 'token_1'
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: @create_update_params
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, token: 'token_1', id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, token: 'token_1', id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, token: 'token_1', id: @user, user: @create_update_params
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, token: 'token_1', id: @user
    end

    assert_redirected_to users_path
  end
end
