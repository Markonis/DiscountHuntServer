require 'test_helper'

class SettingsControllerTest < ActionController::TestCase
  setup do
    @setting = settings(:setting_one)
  end

  test "should get index" do
    get :index, token: 'token_1'
    assert_response :success
    assert_not_nil assigns(:settings)
  end

  test "should get new" do
    get :new, token: 'token_1'
    assert_response :success
  end

  test "should create setting" do
    assert_difference('Setting.count') do
      post :create, token: 'token_1', setting: { enable_background_process: @setting.enable_background_process, search_radius: @setting.search_radius, user_id: @setting.user_id }
    end

    assert_redirected_to setting_path(assigns(:setting))
  end

  test "should show setting" do
    get :show, token: 'token_1', id: @setting
    assert_response :success
  end

  test "should get edit" do
    get :edit, token: 'token_1', id: @setting
    assert_response :success
  end

  test "should update setting" do
    patch :update, token: 'token_1', id: @setting, setting: { enable_background_process: @setting.enable_background_process, search_radius: @setting.search_radius, user_id: @setting.user_id }
    assert_redirected_to setting_path(assigns(:setting))
  end

  test "should destroy setting" do
    assert_difference('Setting.count', -1) do
      delete :destroy, token: 'token_1', id: @setting
    end

    assert_redirected_to settings_path
  end
end
