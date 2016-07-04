json.array!(@user_location_changes) do |user_location_change|
  json.extract! user_location_change, :id, :user_id, :location_id
  json.url user_location_change_url(user_location_change, format: :json)
end
