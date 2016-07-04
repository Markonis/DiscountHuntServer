json.extract! @user_session, :token
json.user @user_session.user, :id, :first_name, :last_name, :setting
