require 'test_helper'

class FriendsRankingsControllerTest < ActionController::TestCase
  setup do
    @friends_ranking = friends_rankings(:one)
  end

  test "should get index" do
    get :index, token: 'token_1'
    assert_response :success
    assert_not_nil assigns(:friends_rankings)
  end

  test "should get new" do
    get :new, token: 'token_1'
    assert_response :success
  end

  test "should create friends_ranking" do
    assert_difference('FriendsRanking.count') do
      post :create, friends_ranking: { user_id: @friends_ranking.user_id }, token: 'token_1'
    end

    assert_redirected_to friends_ranking_path(assigns(:friends_ranking))
  end

  test "should show friends_ranking" do
    get :show, id: @friends_ranking, token: 'token_1'
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @friends_ranking, token: 'token_1'
    assert_response :success
  end

  test "should update friends_ranking" do
    patch :update, id: @friends_ranking, friends_ranking: { user_id: @friends_ranking.user_id }, token: 'token_1'
    assert_redirected_to friends_ranking_path(assigns(:friends_ranking))
  end

  test "should destroy friends_ranking" do
    assert_difference('FriendsRanking.count', -1) do
      delete :destroy, id: @friends_ranking, token: 'token_1'
    end

    assert_redirected_to friends_rankings_path
  end
end
