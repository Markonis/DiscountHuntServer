json.array!(@friendships) do |friendship|
  json.extract! friendship, :id, :user_a_id, :user_b_id
  json.url friendship_url(friendship, format: :json)
end
