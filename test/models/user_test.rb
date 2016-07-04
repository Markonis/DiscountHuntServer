require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "rank" do
    instance = users(:user_one)
    assert_equal 2, instance.rank

    instance = users(:user_two)
    assert_equal 0, instance.rank
  end
end