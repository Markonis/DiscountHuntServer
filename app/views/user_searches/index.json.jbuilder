json.array!(@user_searches) do |user_search|
  json.extract! user_search, :id, :query, :hardware_uuid
  json.url user_search_url(user_search, format: :json)
end
