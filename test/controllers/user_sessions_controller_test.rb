require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  setup do
    @user_session = user_sessions(:user_session_one)
  end

  test "should create user_session" do
    assert_difference('UserSession.count') do
      post :create, user_session: { token: @user_session.token, user_id: @user_session.user_id }
    end

    assert_redirected_to user_session_path(assigns(:user_session))
  end

  test "should update user_session" do
    patch :update, id: @user_session, user_session: { token: @user_session.token, user_id: @user_session.user_id }
    assert_redirected_to user_session_path(assigns(:user_session))
  end
end
