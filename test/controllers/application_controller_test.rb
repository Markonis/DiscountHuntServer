require 'test_helper'

class ActionControllerTest < ActionController::TestCase

  setup do
    class ::TestingController < ApplicationController
      before_action :check_user_session
      def test
        render :nothing => true
      end
    end

    @controller = TestingController.new
  end

  teardown do
    Object.send(:remove_const, :TestingController)
  end

  test "given an active session it does not return 403" do
    get :test, token: 'token_1'
    assert_response :success
  end

  test "given there is no active session it returns 403" do
    get :test, token: 'ABC'
    assert_response :forbidden
  end
end