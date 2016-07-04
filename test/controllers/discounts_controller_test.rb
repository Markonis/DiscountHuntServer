require 'test_helper'

class DiscountsControllerTest < ActionController::TestCase
  setup do
    @discount = discounts(:discount_one)
  end

  test "should get index" do
    get :index, token: 'token_1'
    assert_response :success
    assert_not_nil assigns(:discounts)
  end

  test "should get new" do
    get :new, token: 'token_1'
    assert_response :success
  end

  test "should create discount" do
    assert_difference('Discount.count') do
      post :create, token: 'token_1', discount: { category: @discount.category, description: @discount.description, location_id: @discount.location_id, price: @discount.price, title: @discount.title, user_id: @discount.user_id, photo_id: @discount.photo_id }
    end

    assert_redirected_to discount_path(assigns(:discount))
  end

  test "should show discount" do
    get :show, token: 'token_1', id: @discount
    assert_response :success
  end

  test "should get edit" do
    get :edit, token: 'token_1', id: @discount
    assert_response :success
  end

  test "should update discount" do
    patch :update, token: 'token_1', id: @discount, discount: { category: @discount.category, description: @discount.description, location_id: @discount.location_id, price: @discount.price, title: @discount.title, user_id: @discount.user_id }
    assert_redirected_to discount_path(assigns(:discount))
  end

  test "should destroy discount" do
    assert_difference('Discount.count', -1) do
      delete :destroy, token: 'token_1', id: @discount
    end

    assert_redirected_to discounts_path
  end
end
