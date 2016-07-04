require 'test_helper'

class DiscountVotesControllerTest < ActionController::TestCase
  setup do
    @discount_vote = discount_votes(:one)
  end

  test "should get index" do
    get :index, token: 'token_1'
    assert_response :success
    assert_not_nil assigns(:discount_votes)
  end

  test "should get new" do
    get :new, token: 'token_1'
    assert_response :success
  end

  test "should create discount_vote" do
    assert_difference('DiscountVote.count') do
      post :create, discount_vote: { discount_id: 3, user_id: 1 }, token: 'token_1'
    end

    assert_redirected_to discount_vote_path(assigns(:discount_vote))
  end

  test "should show discount_vote" do
    get :show, id: @discount_vote, token: 'token_1'
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @discount_vote, token: 'token_1'
    assert_response :success
  end

  test "should update discount_vote" do
    patch :update, id: @discount_vote, discount_vote: { discount_id: @discount_vote.discount_id, user_id: @discount_vote.user_id }, token: 'token_1'
    assert_redirected_to discount_vote_path(assigns(:discount_vote))
  end

  test "should destroy discount_vote" do
    assert_difference('DiscountVote.count', -1) do
      delete :destroy, id: @discount_vote, token: 'token_1'
    end

    assert_redirected_to discount_votes_path
  end
end
