json.extract! @user_session, :token, :created_at, :updated_at
json.user @user_session.user, :id, :first_name, :last_name, :phone, :username, :created_at, :updated_at, :photo
