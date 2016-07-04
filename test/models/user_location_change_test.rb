require 'test_helper'

class UserLocationChangeTest < ActiveSupport::TestCase
  test "changes the location of the user" do
    user = users(:user_one)
    instance = UserLocationChange.create user: user, location_id: 2

    assert user.location_id == 2
  end
end
