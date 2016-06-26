require 'test_helper'

class FriendshipsControllerTest < ActionController::TestCase
  setup do
    @friendship = friendships(:friendship_one)
  end

  test "should get index" do
    get :index, token: 'token_1'
    assert_response :success
    assert_not_nil assigns(:friendships)
  end

  test "should get new" do
    get :new, token: 'token_1'
    assert_response :success
  end

  test "should create friendship" do
    assert_difference('Friendship.count') do
      post :create, token: 'token_1', friendship: { user_a_id: @friendship.user_a_id, user_b_id: @friendship.user_b_id }
    end

    assert_redirected_to friendship_path(assigns(:friendship))
  end

  test "should show friendship" do
    get :show, token: 'token_1', id: @friendship
    assert_response :success
  end

  test "should get edit" do
    get :edit, token: 'token_1', id: @friendship
    assert_response :success
  end

  test "should update friendship" do
    patch :update, token: 'token_1', id: @friendship, friendship: { user_a_id: @friendship.user_a_id, user_b_id: @friendship.user_b_id }
    assert_redirected_to friendship_path(assigns(:friendship))
  end

  test "should destroy friendship" do
    assert_difference('Friendship.count', -1) do
      delete :destroy, token: 'token_1', id: @friendship
    end

    assert_redirected_to friendships_path
  end
end
