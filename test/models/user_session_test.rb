require 'test_helper'

class UserSessionTest < ActiveSupport::TestCase
  test "age_in_seconds" do
    user_session = UserSession.new
    user_session.updated_at = DateTime.now - 5.seconds
    assert_in_delta 5.seconds, user_session.age_in_seconds, 0.1
  end

  test "active?" do
    user_session = UserSession.new

    user_session.updated_at = DateTime.now - (UserSession::MAX_AGE - 1.minute)
    assert user_session.active?

    user_session.updated_at = DateTime.now - (UserSession::MAX_AGE + 1.minute)
    assert_not user_session.active?
  end
end
