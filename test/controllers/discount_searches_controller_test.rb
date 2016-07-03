require 'test_helper'

class DiscountSearchesControllerTest < ActionController::TestCase
  setup do
    @discount_search = discount_searches(:one)
  end

  test "should get index" do
    get :index, token: 'token_1'
    assert_response :success
    assert_not_nil assigns(:discount_searches)
  end

  test "should get new" do
    get :new, token: 'token_1'
    assert_response :success
  end

  test "should create discount_search" do
    assert_difference('DiscountSearch.count') do
      post :create, discount_search: {
          query: @discount_search.query,
          user_id: @discount_search.user_id,
          location_attributes: {lat: 2, lng: 3}
        }, token: 'token_1'
    end

    assert_redirected_to discount_search_path(assigns(:discount_search))
  end

  test "should show discount_search" do
    get :show, id: @discount_search, token: 'token_1'
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @discount_search, token: 'token_1'
    assert_response :success
  end

  test "should update discount_search" do
    patch :update, id: @discount_search, discount_search: { query: @discount_search.query, result: @discount_search.result, user_id: @discount_search.user_id }, token: 'token_1'
    assert_redirected_to discount_search_path(assigns(:discount_search))
  end

  test "should destroy discount_search" do
    assert_difference('DiscountSearch.count', -1) do
      delete :destroy, id: @discount_search, token: 'token_1'
    end

    assert_redirected_to discount_searches_path
  end
end
