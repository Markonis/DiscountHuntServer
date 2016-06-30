json.extract! @user, :id, :first_name, :last_name, :phone, :username, :created_at, :updated_at
json.location @user.location
json.photo @user.photo
